#include "ros/ros.h"
#include "planner/manager_msgs.h"
#include "planner/rrtstar.h"
#include "planner/obstacles.h"
#include "geometry_msgs/Point.h"
#include "visualization_msgs/Marker.h"

RRTSTAR *rrtstar;
bool boolReached = false;
bool boolInitialed = false;
bool boolNewPath = true;
double agent_x=-100,agent_y=-100;//last time coor
Vector2f aimPoint;
ros::Publisher path_pub;
ros::Publisher nextPosition;
int counter = 0;

void rrtstar_algo(){
  // RRTSTAR Algorithm
  while(ros::ok()){
    ros::spinOnce();
    if(!boolInitialed)continue;
    Node *q = rrtstar->getRandomNode();
    if (q) {
      Node *qNearest = rrtstar->nearest(q->position);
      if (rrtstar->distance(q->position, qNearest->position) > 0.1) {//////////////changed
        Vector3f newConfigPosOrient;
        DubinsPath path;
        if (BOT_FOLLOW_DUBIN)
        newConfigPosOrient = rrtstar->newDubinConfig(q, qNearest, path);
        else
        newConfigPosOrient = rrtstar->newConfig(q, qNearest);
        Vector2f newConfigPos(newConfigPosOrient.x(), newConfigPosOrient.y());
        if (!rrtstar->obstacles->isSegmentInObstacle(newConfigPos, qNearest->position)) {
          Node *qNew = new Node;
          qNew->position = newConfigPos;
          qNew->orientation = newConfigPosOrient.z();
          qNew->path = path;
          vector<Node *> Qnear;
          rrtstar->near(qNew->position, rrtstar->step_size*RRTSTAR_NEIGHBOR_FACTOR, Qnear);
          //ROS_INFO("Found Nearby ");
          Node *qMin = qNearest;
          double cmin = rrtstar->Cost(qNearest) + rrtstar->PathCost(qNearest, qNew);
          for(int j = 0; j < Qnear.size(); j++){
            Node *qNear = Qnear[j];
            if(!rrtstar->obstacles->isSegmentInObstacle(qNear->position, qNew->position) &&
            (rrtstar->Cost(qNear)+rrtstar->PathCost(qNear, qNew)) < cmin ){
              qMin = qNear; cmin = rrtstar->Cost(qNear)+rrtstar->PathCost(qNear, qNew);
            }
          }
          rrtstar->add(qMin, qNew);
          // ROS_INFO_STREAM("New Node Added! "<<rrtstar->nodes.size());
          for(int j = 0; j < Qnear.size(); j++){
            Node *qNear = Qnear[j];
            if(!rrtstar->obstacles->isSegmentInObstacle(qNew->position, qNear->position) &&
            (rrtstar->Cost(qNew)+rrtstar->PathCost(qNew, qNear)) < rrtstar->Cost(qNear) ){
              Node *qParent = qNear->parent;
              // Remove edge between qParent and qNear
              qParent->children.erase(std::remove(qParent->children.begin(), qParent->children.end(), qNear), qParent->children.end());

              // Add edge between qNew and qNear
              qNear->cost = rrtstar->Cost(qNew) + rrtstar->PathCost(qNew, qNear);
              qNear->parent = qNew;
              qNew->children.push_back(qNear);
            }
          }
        }
      }
    }
    if(!boolReached){
      if (rrtstar->reached()) {
        // ROS_INFO_STREAM(rrtstar->nodes.size());
        // ROS_INFO_STREAM(rrtstar->distance(rrtstar->lastNode->position, rrtstar->endPos));
        ROS_INFO("Reached Destination!");
        boolReached = true;
      }
    }
  }
}

void find_path(const planner::manager_msgs::ConstPtr& msg)
{
  if(!boolInitialed)return;
  if(msg->flag==false){
    // agent_x = msg->agent_x;
    // agent_y = msg->agent_y;
    if (boolReached) {
      Vector2f currentPoint(msg->agent_x+20,msg->agent_y+20);
      if(boolNewPath || abs(agent_x-currentPoint.x())>0.05 || abs(agent_y - currentPoint.y())>0.05){//agent_x != currentPoint.x() || agent_y != currentPoint.y()
        ROS_INFO_STREAM("New Path");
        boolNewPath = false;
        Node *q;
        q = rrtstar->nearest(currentPoint);
        //marker for path
        visualization_msgs::Marker marker;
        marker.header.frame_id = "/base";
        marker.header.stamp = ros::Time();
        marker.ns = "rrt";
        marker.id = 0;
        marker.type = visualization_msgs::Marker::LINE_STRIP;
        marker.action = visualization_msgs::Marker::ADD;
        marker.pose.position.x = 0;
        marker.pose.position.y = 0;
        marker.pose.position.z = 0;
        marker.pose.orientation.x = 0.0;
        marker.pose.orientation.y = 0.0;
        marker.pose.orientation.z = 0.0;
        marker.pose.orientation.w = 1.0;
        marker.scale.x = 0.1;
        marker.scale.y = 0.1;
        marker.scale.z = 0.1;
        marker.color.a = 1.0; // Don't forget to set the alpha!
        marker.color.r = 1.0;
        marker.color.g = 0.0;
        marker.color.b = 0.0;
        geometry_msgs::Point pointofPath;
        //point for nextPosition
        geometry_msgs::Point nxPoint;
        //calculate nextPosition
        pointofPath.x=q->position.x()-20;
        pointofPath.y=q->position.y()-20;
        marker.points.push_back(pointofPath);
        q = q->parent;
        if(q != NULL){
          aimPoint[0]=q->position.x();
          aimPoint[1]=q->position.y();
          Vector2f direction(aimPoint - currentPoint);
          double distance(sqrt(direction.transpose()*direction));
          // ROS_INFO_STREAM(distance);
          direction/=distance*50;
          Vector2f v2fNxPoint(currentPoint+direction);
          // ROS_INFO_STREAM(v2fNxPoint);
          agent_x = v2fNxPoint.x();
          agent_y = v2fNxPoint.y();
          nxPoint.x=v2fNxPoint.x()-20;
          nxPoint.y=v2fNxPoint.y()-20;
          nextPosition.publish(nxPoint);
        }
        //calculate Path

        while (q != NULL) {
          // ROS_INFO_STREAM("Next Point is :"<<q->position.x()-20<<" "<<q->position.y()-20);
          pointofPath.x=q->position.x()-20;
          pointofPath.y=q->position.y()-20;
          marker.points.push_back(pointofPath);
          q = q->parent;
        }
        path_pub.publish( marker );
        ROS_INFO_STREAM("New Path Found");
        return;
      }
      else{
        if(counter>rand()%100+20){
          // ROS_INFO_STREAM("Path reset!"<<rand()%60+30);
          boolNewPath = true;
          counter = 0;
          return;
        }
        Vector2f direction(aimPoint - currentPoint);
        double distance(sqrt(direction.transpose()*direction));
        if(distance<0.05){
          boolNewPath = true;
          return;
        }else boolNewPath = false;
        // ROS_INFO_STREAM(distance);
        direction/=distance*75;
        Vector2f v2fNxPoint(currentPoint+direction);
        // ROS_INFO_STREAM(v2fNxPoint);
        geometry_msgs::Point nxPoint;
        agent_x = v2fNxPoint.x();
        agent_y = v2fNxPoint.y();
        nxPoint.x=v2fNxPoint.x()-20;
        nxPoint.y=v2fNxPoint.y()-20;
        nextPosition.publish(nxPoint);
        ++counter;
      }

    }
    else
    {
      // // if not reached yet, then shortestPath will start from the closest node to end point.
      // q = rrtstar->nearest(rrtstar->endPos);
      ROS_INFO("Not yet!");
    }
  }
}

void initial(const geometry_msgs::Point::ConstPtr& initPoint){
  END_POS_X = initPoint->x+20;
  END_POS_Y = initPoint->y+20;
  // ROS_INFO_STREAM("End Point is :"<<END_POS_X<<" "<<END_POS_Y);
  rrtstar = new RRTSTAR;
  Vector2f obFirstPoint(11,26);
  Vector2f obSecPoint(3,0);
  rrtstar->obstacles->addObstacle(obFirstPoint,obSecPoint,2);
  obFirstPoint(0)=22;
  obFirstPoint(1)=18;
  obSecPoint(0)=2;
  rrtstar->obstacles->addObstacle(obFirstPoint,obSecPoint,2);
  obFirstPoint(0)=21;
  obFirstPoint(1)=27;
  obSecPoint(0)=2.5;
  rrtstar->obstacles->addObstacle(obFirstPoint,obSecPoint,2);
  obFirstPoint(0)=32;
  obFirstPoint(1)=25;
  obSecPoint(0)=3;
  rrtstar->obstacles->addObstacle(obFirstPoint,obSecPoint,2);
  rrtstar->setStepSize(1);
  boolInitialed = true;
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "rrt_str");
  ros::NodeHandle n;
  path_pub = n.advertise<visualization_msgs::Marker>( "rrt_path", 0 );
  nextPosition = n.advertise<geometry_msgs::Point>( "nextPosition", 0 );
  ros::Subscriber subInit = n.subscribe("Position", 1, initial);
  ros::Subscriber sub = n.subscribe("manager_task", 1, find_path);
  rrtstar_algo();
  return 0;
}
