#!/usr/bin/env python

import rospy
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
pub_manager = rospy.Publisher('manager_task',manager_msgs, queue_size=10)
rospy.sleep(0.5)

def main():
    print("Init!")
    moving_obs = rospy.Subscriber('/planner/obstacle_status',obstacle_status,selection)
    positionNow = rospy.Subscriber('/Position',Point,callback_positionNow)
    rospy.spin()

def callback_positionNow(data):
    global agent_x
    global agent_y
    agent_x = data.x
    agent_y = data.y

def dist_calc(x1,y1,x2,y2):
    return math.sqrt((x1-x2)**2+(y1-y2)**2)

def selection(data):
    global agent_x
    global agent_y
    print("Received!")
    manager_msg = manager_msgs()
    # Calculate the distance between the agent and the obstacle
    # Calcuate the radius
    # Compare the difference
    # Send out the flag
    # radius = data.vx
    radius = 2
    infl_r = 5
    dist = dist_calc(agent_x,agent_y,data.x,data.y)
    if (infl_r>dist):
        # In the influence circle
        # True means collision and should run potenrtial field
        print("Potential!")
        manager_msg.flag = True
        manager_msg.infl_dist = infl_r - radius
        manager_msg.obs_r = radius
        manager_msg.obs_x = data.x
        manager_msg.obs_y = data.y
        manager_msg.agent_x = agent_x
        manager_msg.agent_y = agent_y
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
        manager_msg.agent_x = agent_x
        manager_msg.agent_y = agent_y
        pub_manager.publish(manager_msg)
if __name__ == '__main__':
    try:
        global agent_x
        global agent_y
        initiation = raw_input("Initiate?:")
        agent_x = float(raw_input("Where do you want to start in the x coordinate:?"))
        agent_y = float(raw_input("y position?:"))
        yes = 'y'
        no = 'n'
        if (initiation == yes):
            main()
        else:
            pass
    except rospy.ROSInterruptException:
        pass
