#!/usr/bin/env python
import math
import rospy
import numpy as np
from geometry_msgs.msg import Point
# import roslib; roslib.load_manifest('visualization_marker_tutorials')
from visualization_msgs.msg import Marker
# from visualization_msgs.msg import MarkerArray
global pt_agent_x
global pt_agent_y
global rrt_agent_x
global rrt_agent_y

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
    # Need to decide which position to use
    finalPoint.x = pt_agent_x
    finalPoint.y = pt_agent_y
    finalPoint.z = 0
    publish_manager.publish(finalPoint)

rospy.Subscriber('/PT_position',Point,callback_PT)
finalPoint = Point()
rospy.init_node('agent_init')
topic = 'agent'
publisher = rospy.Publisher(topic, Marker,queue_size = 100)
publish_manager = rospy.Publisher('/Position',Point,queue_size = 100)


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
    marker.pose.position.x = finalPoint.x
    marker.pose.position.y = finalPoint.y
    marker.pose.position.z = 0
    id = 0
    sendtoManager()
    publisher.publish(marker)
    # count += 1
    rospy.sleep(0.01)
