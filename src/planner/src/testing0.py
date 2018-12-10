#!/usr/bin/env python
import math
import rospy
import numpy as np
from geometry_msgs.msg import Point
# import roslib; roslib.load_manifest('visualization_marker_tutorials')
from visualization_msgs.msg import Marker
# from visualization_msgs.msg import MarkerArray

def callback_PT(data):
    global pt_agent_x
    global pt_agent_y
    pt_agent_x = data.x
    pt_agent_y = data.y

def callback_RRT(data):
    global rrt_agent_x
    global rrt_agent_y
    rrt_agent_x = data.x
    rrt_agent_y = data.y

def sendtoManager():
    
rospy.Subscribe('/PT_position',Point,callback_PT)
rospy.init_node('agent_init')
global agent_x
global agent_y
topic = 'agent'
publisher = rospy.Publisher(topic, Marker)
publish_manager = rospy.Publisher('/Position',Point)

publish_manager.publish(marker)

while not rospy.is_shutdown():
    marker = Marker()
    marker.header.frame_id = "/base"
    marker.type = marker.SPHERE
    marker.action = marker.ADD
    marker.scale.x = 0.5
    marker.scale.y = 0.5
    marker.scale.z = 0.2
    marker.color.a = 1.0
    marker.color.r = 1.0
    marker.color.g = 1.0
    marker.color.b = 0.0
    marker.pose.orientation.w = 1.0
    # Position subscribed from both RRT and Potetial
    marker.pose.position.x = agent_x
    marker.pose.position.y = agent_y
    marker.pose.position.z = 0
    id = 0
    publisher.publish(marker)
    # count += 1
    rospy.sleep(0.01)
