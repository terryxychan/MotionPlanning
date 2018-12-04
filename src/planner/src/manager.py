#!/usr/bin/env python

import rospy
import math
from std_msgs.msg import String
from std_msgs.msg import Bool
from planner.msg import manager_msgs
from using_markers.msg import obstacle_status
# This node should subscribe to: using_marker, basic_shape, next point
# Publishes a flag to switch scheme, agent to RVIZ
# Calculates the influence radius based on velocity

# Create the agent
agent_x = 0
agent_y = 0

rospy.init_node('manager', anonymous=True)
pub_manager = rospy.Publisher('manager_task',manager_msgs, queue_size=10)
rospy.sleep(0.5)

def main():
    print("Init!")
    moving_obs = rospy.Subscriber('/planner/obstacle_status',obstacle_status,selection)
    rospy.spin()

def dist_calc(agent_x,agent_y,obs_x,obs_y):
    return math.sqrt((agent_x-obs_x)**2+(agent_y-obs_y)**2)

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
    dist = dist_calc(agent_x,agent_y,data.x,data.y)
    if (radius>dist):
        # In the influence circle
        # True means collision and should run potenrtial field
        print("Potential!")
        manager_msg.flag = True
        manager_msg.radius = radius
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
        manager_msg.radius = radius
        manager_msg.obs_x = data.x
        manager_msg.obs_y = data.y
        manager_msg.agent_x = agent_x
        manager_msg.agent_y = agent_y
        pub_manager.publish(manager_msg)

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass
