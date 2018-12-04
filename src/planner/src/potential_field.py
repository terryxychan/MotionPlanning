#!/usr/bin/env python
import rospy
from std_msgs.msg import String
from std_msgs.msg import Bool
from planner.msg import manager_msgs
from visualization_msgs.msg import Marker
# This node should subscribe to: using_marker, basic_shape, next point
# Publishes a flag to switch scheme, agent to RVIZ
# Calculates the influence radius based on velocity

counter = 0

def callback(data):
    if (data.flag == True):
        global counter
        counter = counter+1
        print('Running Potential field')
        print(counter)

if __name__ == '__main__':
    try:
        rospy.init_node('potential_field', anonymous=True)
        moving_obs = rospy.Subscriber('manager_task',manager_msgs,callback)
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
