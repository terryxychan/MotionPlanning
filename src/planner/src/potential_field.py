#!/usr/bin/env python
import rospy
import math
import numpy as np
from numpy import linalg as LA
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
repulsizeWeight = 0.2
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
    return dist

def staticObs():
    sobs_1 = obstacle(np.array([10,7]),5,0.2)
    sobs_2 = obstacle(np.array([-6,6]),6,0.2)
    sobs_3 = obstacle(np.array([12,5]),6,0.2)
    sobs_4 = obstacle(np.array([1,1]),4,0.2)
    return ReturnValueObstacle(sobs_1,sobs_2,sobs_3,sobs_4)

def dist_circle(obstacle,agent_coor):
    dist_agent_to_center = calculateDistance(obstacle.coor[0],obstacle.coor[1],agent_coor[0],agent_coor[1])
    dist_agent_to_surface = dist_agent_to_center - obstacle.r
    point_sphere = obstacle.r * (1/LA.norm(agent_coor-obstacle.coor))*(agent_coor-obstacle.coor)+obstacle.coor
    return ReturnValue(dist_agent_to_surface,point_sphere)

def U_rep_grad(obstacle,agent_coor):
    dist_sphere = dist_circle(obstacle,agent_coor)
    grad_U_rep = (-1/dist_sphere.d_s - 1/obstacle.r_i)*(1/(dist_sphere.d_s**2))*((agent_coor-dist_sphere.point_sphere)/(LA.norm(agent_coor-obstacle.coor)))
    return grad_U_rep

def xPath(obstacle,agent_coor,step):
    static_obstacles = staticObs()
    total_U_rep_grad = repulsizeWeight * (U_rep_grad(obstacle,agent_coor)+U_rep_grad(static_obstacles.obs1,agent_coor)+\
                        U_rep_grad(static_obstacles.obs2,agent_coor)+U_rep_grad(static_obstacles.obs3,agent_coor)+ \
                        U_rep_grad(static_obstacles.obs4,agent_coor))
    xPath = agent_coor - total_U_rep_grad*step
    return xPath

# def callback(static_obs):
#     obstacle_1 = obstacle(marker.coor,marker.r,marker.r_i)

def callback(data):
    agent_coor = np.array([data.agent_x,data.agent_y])
    moving_obstacle = obstacle(np.array([data.obs_x,data.obs_y]),data.obs_r,data.infl_dist)
    # Add all the static obstacles
    nextPoint_PT = Point()
    if (data.flag == True):
        nextPoint = xPath(moving_obstacle,agent_coor,0.01)
        # global counter
        # counter = counter+1
        nextPoint_PT.x = nextPoint[0]
        nextPoint_PT.y = nextPoint[1]
        nextPoint_PT.z = 0
        point_PT.publish(nextPoint_PT)
        print('Running Potential field')
        print(nextPoint)
    else:
        print('Waiting for collision')
        # creates next coordinate until potential field is no longer active

if __name__ == '__main__':
    try:
        rospy.init_node('potential_field', anonymous=True)
        moving_obs = rospy.Subscriber('manager_task',manager_msgs,callback)
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
