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

def selection(data):
    global agent_x_now
    global agent_y_now
    print("Received!")
    manager_msg = manager_msgs()
    # Calculate the distance between the agent and the obstacle
    # Calcuate the radius
    # Compare the difference
    # Send out the flag
    # radius = data.vx
    # For now: only pass on pt_coordinates
    if init_flag == 1:
        radius = 2
        infl_r = 4
        dist = dist_calc(agent_x_now,agent_y_now,data.x,data.y)
        if (infl_r>dist):
            # In the influence circle
            # True means collision and should run potenrtial field
            print("Potential!")
            manager_msg.flag = True
            manager_msg.infl_dist = infl_r - radius
            manager_msg.obs_r = radius
            manager_msg.obs_x = data.x
            manager_msg.obs_y = data.y
            manager_msg.agent_x = agent_x_now
            manager_msg.agent_y = agent_y_now
            pub_manager.publish(manager_msg)
        else:
            # Outside circle
            # False means RRT*
            print("RRT!")
            manager_msg.flag = False
            manager_msg.infl_dist = infl_r - radius
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
    rospy.Subscriber('/PT_position',Point,callback)
    # initiationPoint = Point()
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
