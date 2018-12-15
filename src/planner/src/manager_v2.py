#!/usr/bin/env python
import rospy
import time
import math
from std_msgs.msg import String
from std_msgs.msg import Bool
from planner.msg import manager_msgs
from using_markers.msg import obstacle_status
from geometry_msgs.msg import Point
from visualization_msgs.msg import Marker

global agent_x_now
global agent_y_now
global initiationPoint
global init_flag
global time_constant
global infl_r
global radius_constant
infl_r = 0.5
time_constant = 1/60.
radius_constant = 0.15
init_flag = 0
initiationPoint = Point()
pub_manager = rospy.Publisher('/manager_task',manager_msgs, queue_size=10)
positionNow = rospy.Publisher('/Position',Point,queue_size=10)
topic = 'agent'
publisher = rospy.Publisher(topic, Marker,queue_size = 100)
marker = Marker()
def makeMarker(x,y):
        marker.id = 0
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
        marker.pose.position.x = x
        marker.pose.position.y = y
        marker.pose.position.z = 0
        publisher.publish(marker)

def dist_calc(x1,y1,x2,y2):
    return math.sqrt((x1-x2)**2+(y1-y2)**2)

def callback(data):
    global agent_x_now
    global agent_y_now
    global infl_r
    infl_r = radiusDistanceCalc(agent_x_now,agent_y_now,data.x,data.y)
    agent_x_now = data.x
    agent_y_now = data.y
    makeMarker(data.x,data.y)
    # rospy.loginfo("publishing marker!")


def initPoint(start_x,start_y,positionNow):
    global agent_x_now
    global agent_y_now
    global init_flag
    agent_x_now = start_x
    agent_y_now = start_y
    rospy.loginfo("Initiating!")
    global initiationPoint
    initiationPoint.x = start_x
    initiationPoint.y = start_y
    initiationPoint.z = 0
    makeMarker(start_x,start_y)
    positionNow.publish(initiationPoint)
    time.sleep(3)
    init_flag = 1
    rospy.loginfo("Done Initiating!")

def radiusDistanceCalc(x0,y0,x1,y1):
    global time_constant
    global obs_vx
    global obs_vy
    global obs_x
    global obs_y
    vx1 = (x1-x0)/time_constant
    vy1 = (y1-y0)/time_constant
    rel_v = ((obs_vx-vx1)**2. + (obs_vy-vy1)**2.)**(1/2.)
    # print((obs_vx-vx1)**2.)
    # print((obs_vy-vy1)**2.)
    radius = radius_constant * rel_v
    if radius >= 6.:
        radius = 6.
    elif radius < 1:
        radius = 1
    else:
        pass
    marker.id = 1
    marker.header.frame_id = "/base"
    marker.ns = "influenceCircle"
    marker.type = marker.SPHERE
    marker.action = marker.ADD
    marker.scale.x = radius*2.
    marker.scale.y = radius*2.
    marker.scale.z = 0.2
    marker.color.a = 0.1
    marker.color.r = 1.0
    marker.color.g = 1.0
    marker.color.b = 0.0
    marker.pose.orientation.w = 1.0
    # Position subscribed from both RRT and Potetial
    marker.pose.position.x = obs_x
    marker.pose.position.y = obs_y
    marker.pose.position.z = 0
    publisher.publish(marker)
    return radius

def selection(data):
    global agent_x_now
    global agent_y_now
    global infl_r
    global obs_vx
    global obs_vy
    global obs_x
    global obs_y
    obs_x = data.x
    obs_y = data.y
    obs_vx = data.vx
    obs_vy = data.vy
    manager_msg = manager_msgs()

    if init_flag == 1:
        radius = 0.25
        dist = dist_calc(agent_x_now,agent_y_now,data.x,data.y)
        if (infl_r- 0.01 >dist):
            print("Potential!")
            manager_msg.flag = True
            manager_msg.infl_dist = float(infl_r - radius)
            manager_msg.obs_r = radius
            manager_msg.obs_x = data.x
            manager_msg.obs_y = data.y
            manager_msg.agent_x = agent_x_now
            manager_msg.agent_y = agent_y_now
            pub_manager.publish(manager_msg)
        else:
            print("RRT!")
            manager_msg.flag = False
            manager_msg.infl_dist = float(infl_r - radius)
            manager_msg.obs_r = radius
            manager_msg.obs_x = data.x
            manager_msg.obs_y = data.y
            manager_msg.agent_x = agent_x_now
            manager_msg.agent_y = agent_y_now
            pub_manager.publish(manager_msg)
    else:
            pass

def main():
    rospy.init_node('manager', anonymous=True)
    rospy.Subscriber('/nextPosition',Point,callback)
    rospy.sleep(0.5)
    initiation = raw_input("Initiate?:")
    start_x = float(raw_input("Where do you want to start in the x coordinate:?"))
    start_y = float(raw_input("y position?:"))
    yes = 'y'
    no = 'n'
    rospy.Subscriber('/planner/obstacle_status',obstacle_status,selection)
    if initiation == yes:
        initPoint(start_x,start_y,positionNow)
    else:
        pass
    rospy.spin()
# Create the agent
if __name__ == '__main__':
    main()
