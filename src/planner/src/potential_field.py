#!/usr/bin/env python
import rospy
import math
import numpy as np
from std_msgs.msg import String
from std_msgs.msg import Bool
from planner.msg import manager_msgs
from visualization_msgs.msg import Marker
from geometry_msgs.msg import Point

global counter
counter = 0
point_PT = rospy.Publisher('/nextPosition',Point,queue_size=100)
repulsizeWeight = 1.
moving_repulsive = 1.
topic = 'pt_arrow'
publisher = rospy.Publisher(topic, Marker,queue_size = 100)
marker = Marker()
ff_points = Point()
marker.points.append(ff_points)
marker.points.append(ff_points)

class obstacle:
     def __init__(self, center_coor, radius, influence_dist):
         self.coor = center_coor
         self.r = radius
         self.d_inf = influence_dist
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
    dist = math.sqrt((x2 - x1)**2. + (y2 - y1)**2.)
    # print(dist)
    return dist

def staticObs():
    obs_1 = obstacle(np.array([1.,7.]),2.5,10.)
    obs_2 = obstacle(np.array([-9.,6.]),3,10.)
    obs_3 = obstacle(np.array([12.,5.]),3,10.)
    obs_4 = obstacle(np.array([2.,-2.]),2,10.)
    return ReturnValueObstacle(obs_1,obs_2,obs_3,obs_4)

def dist_circle(obstacle,agent_coor):
    dist_agent_to_center = calculateDistance(obstacle.coor[0],obstacle.coor[1],agent_coor[0],agent_coor[1])
    # print(dist_agent_to_center)
    d_s = dist_agent_to_center - obstacle.r
    # print(obstacle.r)
    # print(d_s)
    point_sphere = obstacle.r * (1./calculateDistance(agent_coor[0],agent_coor[1],obstacle.coor[0],obstacle.coor[1]))*(agent_coor-obstacle.coor)+obstacle.coor
    return ReturnValue(d_s,point_sphere)

def U_rep_grad(obstacle,agent_coor):
    dist_sphere = dist_circle(obstacle,agent_coor)
    # print(obstacle.d_inf)
    if (obstacle.d_inf > dist_sphere.d_s):
        grad_U_rep = -(1./dist_sphere.d_s - 1./obstacle.d_inf)*(1./(dist_sphere.d_s**2.))*((agent_coor-dist_sphere.point_sphere)/calculateDistance(agent_coor[0],agent_coor[1],dist_sphere.point_sphere[0],dist_sphere.point_sphere[1]))
    else:
        grad_U_rep = np.array([0.,0.])
    return grad_U_rep

def xPath(obstacle,agent_coor,step):
    static_obstacles = staticObs()
    moving_repulsive= 1.*(obstacle.d_inf/0.75)**2
    total_U_rep_grad = moving_repulsive * U_rep_grad(obstacle,agent_coor) + repulsizeWeight * (U_rep_grad(static_obstacles.obs1,agent_coor)+\
                        U_rep_grad(static_obstacles.obs2,agent_coor)+U_rep_grad(static_obstacles.obs3,agent_coor)+ \
                        U_rep_grad(static_obstacles.obs4,agent_coor))
    nrm_grad = calculateDistance(0.,0.,total_U_rep_grad[0],total_U_rep_grad[1])
    if nrm_grad > 5.:
        print(total_U_rep_grad)
        total_U_rep_grad = total_U_rep_grad/nrm_grad
        print(total_U_rep_grad)
        print(nrm_grad)
    else:
        # print(total_U_rep_grad)
        pass
    makeArrow(total_U_rep_grad,agent_coor)
    xPath = agent_coor - total_U_rep_grad*step
    return xPath

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
        end_point.x = vector[0] * -10.
        end_point.y = vector[1] * -10.
        end_point.z = 0.0
        marker.points.append(end_point)
        marker.scale.x = 0.2
        marker.scale.y = 0.2
        marker.scale.z = 0.2
        marker.color.a = 0.3
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
        nextPoint_PT.x = nextPoint[0]
        nextPoint_PT.y = nextPoint[1]
        nextPoint_PT.z = 0
        point_PT.publish(nextPoint_PT)
    else:
        makeArrow(np.array([0,0]),np.array([0,0]))
        pass
if __name__ == '__main__':
    try:
        rospy.init_node('potential_field', anonymous=True)
        moving_obs = rospy.Subscriber('manager_task',manager_msgs,callback)
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
