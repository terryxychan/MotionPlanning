#include "ros/ros.h"
#include "planner/manager_msgs.h"
#include "planner/rrtstar.h"
#include "planner/obstacles.h"

RRTSTAR *rrtstar = new RRTSTAR;

void rrtstar_algo(){
  //RRTSTAR START//////////////////////////////////////////
  rrtstar->setMaxIterations(9999);
  rrtstar->setStepSize(2);
/*
  // RRTSTAR Algorithm
  for(int i = 0; i < rrtstar->max_iter; i++) {
    Node *q = rrtstar->getRandomNode();
    if (q) {
      Node *qNearest = rrtstar->nearest(q->position);
      if (rrtstar->distance(q->position, qNearest->position) > rrtstar->step_size) {
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
          ROS_INFO("Found Nearby ");
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
    if (rrtstar->reached()) {
      ROS_INFO("Reached Destination!");
      break;
    }
  }
  Node *q;
  if (rrtstar->reached()) {
    q = rrtstar->lastNode;
  }
  else
  {
    // if not reached yet, then shortestPath will start from the closest node to end point.
    q = rrtstar->nearest(rrtstar->endPos);
    ROS_INFO("Exceeded max iterations!");
  }
  // generate shortest path to destination.
  while (q != NULL) {
    rrtstar->path.push_back(q);
    q = q->parent;
  }*/
}

void find_path(const planner::manager_msgs::ConstPtr& msg)
{
  if(msg->flag==false){
    ROS_INFO("I heard msg from manager!");





  }
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "rrt_str");
  ros::NodeHandle n;
  ros::Subscriber sub = n.subscribe("manager_task", 10, find_path);
  rrtstar_algo();
  ros::spin();
  return 0;
}
