# MotionPlanning
## Real-Time Sample-based Planner with Artificial Potential Field for Dynamic Obstacle Avoidance
This is the Motion Planning Final Project created by Yukyu Chan and Hanlong Chen.

The simulation is built on top of Dawei Zhang's Geomagic Touch teleoperator project: 
Haptic-shared-control:[GitHub Pages](https://github.com/cairlab/haptic-shared-control.git).
The haptic-shared-control project provided us with the platform to simulate the environment we would later build our algorithm on.

In order to run the simulation:
Open the Geomagic Touch interface: 
'''
roslaunch geomagic_control geomagic.launch
'''
Create the environmnt by running:
'''
rosrun using_markers using_markers
rosrun using_markers static_obstacles
'''
Run the manager:
'''
rosrun planner manager_v2.py
'''
Run RRT*:
'''
rosrun planner rrt_star
'''
Run Potential field:
'''
rosrun planner potential_field.py
'''
