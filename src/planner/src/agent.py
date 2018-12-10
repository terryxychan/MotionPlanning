#!/usr/bin/env python
import math
import rospy
import numpy as np
from geometry_msgs.msg import Point
# import roslib; roslib.load_manifest('visualization_marker_tutorials')
from visualization_msgs.msg import Marker
# from visualization_msgs.msg import MarkerArray
global agent_x
global agent_y

def callback(data):
    global agent_x
    global agent_y
    agent_x = data.x
    agent_y = data.y

def sendtoManager():
    # Need to decide which position to use
    finalPoint.x = agent_x
    finalPoint.y = agent_y
    finalPoint.z = 0
    publish_manager.publish(finalPoint)

def callback_inititate(data):
    global agent_x
    global agent_y
    if (data.flag == false):
        agent_x = data.x
        agent_y = data.y
        print('Inititating')
    else:
        pass

rospy.Subscriber('/Position',Point,callback)
finalPoint = Point()
rospy.init_node('agent_init')
topic = 'agent'
publisher = rospy.Publisher(topic, Marker,queue_size = 100)
publish_manager = rospy.Publisher('/Position',Point,queue_size = 100)
initiation = rospy.Subscriber('/inititate,manager_msgs',callback_inititate)

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
