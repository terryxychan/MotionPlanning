#!/usr/bin/env python
import rospy
import math
import numpy as np
from std_msgs.msg import String
from std_msgs.msg import Bool
from planner.msg import manager_msgs
from visualization_msgs.msg import Marker
from geometry_msgs.msg import Point
# This node should subscribe to: using_marker, basic_shape, next point
# Publishes a flag to switch scheme, agent to RVIZ
# Calculates the influence radius based on velocity
global counter
counter = 0
point_PT = rospy.Publisher('/PT_position',Point,queue_size=100)
repulsizeWeight = 0.1
topic = 'pt_arrow'
publisher = rospy.Publisher(topic, Marker,queue_size = 100)
marker = Marker()
ff_points = Point()
marker.points.append(ff_points)
marker.points.append(ff_points)
# marker.points = Point()
# This node is the potenrial field node where it subscribes to the status of
# the agent, position, velocity, accelration of the moving obstacle and the static obstacle information
# to generate the potential field around the obstacles.

# dist_sphere has inputs of all the center of the obstacles, influence radius and
# influence radius and the coordinates of our agent.
class obstacle:
     def __init__(self, center_coor, radius, influence_dist):
         self.coor = center_coor
         self.r = radius
         self.r_i = influence_dist
#
class ReturnValue(object):
  def __init__(self, dist_to_surface, point_sphere):
     self.d_s = dist_to_surface
     self.point_sphere = point_sphere

class ReturnValueObstacle(object):
  def __init__(self, obs1, obs2, obs3, obs4):
     self.obs1 = obs1
     self.obs2 = obs2
     self.obs3 = obs3
     self.obs4 = obs4

def calculateDistance(x1,y1,x2,y2):
    dist = math.sqrt((x2 - x1)**2 + (y2 - y1)**2)
    return float(dist)

def staticObs():
    obs_1 = obstacle(np.array([1,7]),5,0.5)
    obs_2 = obstacle(np.array([-9,6]),6,0.5)
    obs_3 = obstacle(np.array([12,5]),6,0.5)
    obs_4 = obstacle(np.array([2,-2]),4,0.5)
    return ReturnValueObstacle(obs_1,obs_2,obs_3,obs_4)

def dist_circle(obstacle,agent_coor):
    dist_agent_to_center = calculateDistance(obstacle.coor[0],obstacle.coor[1],agent_coor[0],agent_coor[1])
    dist_agent_to_surface = dist_agent_to_center - obstacle.r
    point_sphere = obstacle.r * (1/calculateDistance(agent_coor[0],agent_coor[1],obstacle.coor[0],obstacle.coor[1]))*(agent_coor-obstacle.coor)+obstacle.coor
    return ReturnValue(dist_agent_to_surface,point_sphere)

def U_rep_grad(obstacle,agent_coor):
    dist_sphere = dist_circle(obstacle,agent_coor)
    if (obstacle.r_i >= dist_sphere.d_s):
        grad_U_rep = -(1/dist_sphere.d_s - 1/obstacle.r_i)*(1/(dist_sphere.d_s**2))*((agent_coor-dist_sphere.point_sphere)/calculateDistance(agent_coor[0],agent_coor[1],obstacle.coor[0],obstacle.coor[1]))
    else:
        grad_U_rep = 0
    return grad_U_rep
# def U_attr_grad(agent_coor):
#     # Use 'quadratic' shape for attractive
#     goal = nb.array([-6,15])
#     U_grad = 2*(1/LA.norm(agent_coor-goal.coor))**

def xPath(obstacle,agent_coor,step):
    static_obstacles = staticObs()
    total_U_rep_grad = repulsizeWeight * ((U_rep_grad(obstacle,agent_coor)+U_rep_grad(static_obstacles.obs1,agent_coor)+\
                        U_rep_grad(static_obstacles.obs2,agent_coor)+U_rep_grad(static_obstacles.obs3,agent_coor)+ \
                        U_rep_grad(static_obstacles.obs4,agent_coor)))
    nrm_grad = calculateDistance(0,0,total_U_rep_grad[0],total_U_rep_grad[1])
    if nrm_grad > 5:
        print(total_U_rep_grad)
        total_U_rep_grad = total_U_rep_grad/nrm_grad
        print(total_U_rep_grad)
        print(nrm_grad)
    else:
        pass
    makeArrow(total_U_rep_grad,agent_coor)
    xPath = agent_coor - total_U_rep_grad*step

    return xPath

# def callback(static_obs):
#     obstacle_1 = obstacle(marker.coor,marker.r,marker.r_i)
def makeArrow(vector,agent_coor):
        marker.points.pop(0)
        marker.points.pop(0)
        marker.id = 11
        marker.header.frame_id = "/base"
        marker.type = marker.ARROW
        marker.action = marker.ADD
        start_point = Point()
        start_point.x = 0
        start_point.y = 0
        start_point.z = 0.0
        marker.points.append(start_point)
        end_point = Point()
        end_point.x = vector[0] * -10
        end_point.y = vector[1] * -10
        end_point.z = 0.0
        marker.points.append(end_point)
        marker.scale.x = 0.5
        marker.scale.y = 0.5
        marker.scale.z = 0.2
        marker.color.a = 1.0
        marker.color.r = 1.0
        marker.color.g = 1.0
        marker.color.b = 1.0
        marker.pose.orientation.w = 1.0
        # Position subscribed from both RRT and Potetial
        marker.pose.position.x = agent_coor[0]
        marker.pose.position.y = agent_coor[1]
        marker.pose.position.z = 0
        publisher.publish(marker)

def callback(data):
    agent_coor = np.array([data.agent_x,data.agent_y])
    moving_obstacle = obstacle(np.array([data.obs_x,data.obs_y]),data.obs_r,data.infl_dist)
    # Add all the static obstacles
    nextPoint_PT = Point()
    if (data.flag == True):
        nextPoint = xPath(moving_obstacle,agent_coor,0.05)
        # global counter
        # counter = counter+1
        nextPoint_PT.x = nextPoint[0]
        nextPoint_PT.y = nextPoint[1]
        nextPoint_PT.z = 0
        point_PT.publish(nextPoint_PT)
        # print('Running Potential field')
        # print(nextPoint)
    else:
        # print('Waiting for collision')
        # creates next coordinate until potential field is no longer active
        pass
if __name__ == '__main__':
    try:
        rospy.init_node('potential_field', anonymous=True)
        moving_obs = rospy.Subscriber('manager_task',manager_msgs,callback)
        # initiation = rospy.Subscriber('/initiation',manager_msgs,callback_initiate)
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
