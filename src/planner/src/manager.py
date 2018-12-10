#!/usr/bin/env python

import rospy
import time
import math
from std_msgs.msg import String
from std_msgs.msg import Bool
from planner.msg import manager_msgs
from using_markers.msg import obstacle_status
from geometry_msgs.msg import Point
# This node should subscribe to: using_marker, basic_shape, next point
# Publishes a flag to switch scheme, agent to RVIZ
# Calculates the influence radius based on velocity

# Create the agent
global agent_x
global agent_y
global initiation

rospy.init_node('manager', anonymous=True)
pub_manager = rospy.Publisher('/manager_task',manager_msgs, queue_size=10)
positionNow = rospy.Publisher('/Position',Point,queue_size=10)
initiate = rospy.Publisher('/initiation',manager_msgs,queue_size=10)
rospy.sleep(0.5)

def main():
    print("Init!")
    moving_obs = rospy.Subscriber('/planner/obstacle_status',obstacle_status,selection)
    rospy.Subscriber('/PT_position',Point,callback_PT)
    finalPoint = Point()
    rospy.spin()

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

def dist_calc(x1,y1,x2,y2):
    return math.sqrt((x1-x2)**2+(y1-y2)**2)

def selection(data):
    global agent_x_now
    global agent_y_now
    global pt_agent_x
    global pt_agent_y
    global rrt_agent_x
    global rrt_agent_y
    print("Received!")
    manager_msg = manager_msgs()
    # Calculate the distance between the agent and the obstacle
    # Calcuate the radius
    # Compare the difference
    # Send out the flag
    # radius = data.vx
    # For now: only pass on pt_coordinates
    agent_x_now = pt_agent_x
    agent_y_now = pt_agent_y
    radius = 2
    infl_r = 5
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
        manager_msg.agent_x = pt_agent_x
        manager_msg.agent_y = pt_agent_y
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
        manager_msg.agent_x = rrt_agent_x
        manager_msg.agent_y = rrt_agent_y
        initiate.publish(manager_msg)

if __name__ == '__main__':
    try:
        global agent_x_now
        global agent_y_now
        initiation = raw_input("Initiate?:")
        agent_x_now = float(raw_input("Where do you want to start in the x coordinate:?"))
        agent_y_now = float(raw_input("y position?:"))
        yes = 'y'
        no = 'n'
        if (initiation == yes):
            initiate = manager_msgs()
            print("Sending initiation command")
            initiate.flag = False
            initiate.infl_dist = 0
            initiate.obs_r = 0
            initiate.obs_x = 0
            initiate.obs_y = 0
            initiate.agent_x = agent_x_now
            initiate.agent_y = agent_y_now
            pub_manager.publish(initiate)
            time.sleep(3)
            initiate.flag = True
            initiate.infl_dist = 0
            initiate.obs_r = 0
            initiate.obs_x = 0
            initiate.obs_y = 0
            initiate.agent_x = agent_x_now
            initiate.agent_y = agent_y_now
            pub_manager.publish(initiate)
            main()
        else:
            pass
    except rospy.ROSInterruptException:
        pass
