#!/usr/bin/env python
import math
import rospy
import numpy as np
from numpy import linalg as LA

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

def calculateDistance(x1,y1,x2,y2):
    dist = math.sqrt((x2 - x1)**2 + (y2 - y1)**2)
    return dist

def dist_circle(obstacle,agent_coor):
    dist_agent_to_center = calculateDistance(obstacle.coor[0],obstacle.coor[1],agent_coor[0],agent_coor[1])
    dist_agent_to_surface = dist_agent_to_center - obstacle.r
    point_sphere = obstacle.r * (1/LA.norm(agent_coor-obstacle.coor))*(agent_coor-obstacle.coor)+obstacle.coor
    return ReturnValue(dist_agent_to_surface,point_sphere)

def U_rep_grad(obstacle,agent_coor):
    dist_sphere = dist_circle(obstacle,agent_coor)
    grad_U_rep = (-1/dist_sphere.d_s - 1/obstacle.r)*(1/(dist_sphere.d_s**2))*((agent_coor-dist_sphere.point_sphere)/(LA.norm(agent_coor-obstacle.coor)))
    return grad_U_rep

def xPath(obstacle,agent_coor,step):
    xPath = agent_coor - U_rep_grad(obstacle,agent_coor)*step
    return xPath

def main():
    obstacle_1 = obstacle(np.array([0,0]),4,2)
    agent_coor = np.array([10,0])
    nextStep = xPath(obstacle_1,agent_coor,0.01)
    print(nextStep)

if __name__ == '__main__':
    main()
