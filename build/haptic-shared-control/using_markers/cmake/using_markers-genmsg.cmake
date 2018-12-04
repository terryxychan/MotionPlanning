# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "using_markers: 4 messages, 0 services")

set(MSG_I_FLAGS "-Iusing_markers:/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(using_markers_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/Point2D.msg" NAME_WE)
add_custom_target(_using_markers_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "using_markers" "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/Point2D.msg" ""
)

get_filename_component(_filename "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/obstacle_status.msg" NAME_WE)
add_custom_target(_using_markers_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "using_markers" "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/obstacle_status.msg" ""
)

get_filename_component(_filename "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/Polygon.msg" NAME_WE)
add_custom_target(_using_markers_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "using_markers" "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/Polygon.msg" "using_markers/Point2D"
)

get_filename_component(_filename "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/environment.msg" NAME_WE)
add_custom_target(_using_markers_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "using_markers" "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/environment.msg" "using_markers/Point2D:using_markers/Polygon"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(using_markers
  "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/Point2D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/using_markers
)
_generate_msg_cpp(using_markers
  "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/obstacle_status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/using_markers
)
_generate_msg_cpp(using_markers
  "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/Polygon.msg"
  "${MSG_I_FLAGS}"
  "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/Point2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/using_markers
)
_generate_msg_cpp(using_markers
  "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/environment.msg"
  "${MSG_I_FLAGS}"
  "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/Point2D.msg;/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/Polygon.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/using_markers
)

### Generating Services

### Generating Module File
_generate_module_cpp(using_markers
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/using_markers
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(using_markers_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(using_markers_generate_messages using_markers_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/Point2D.msg" NAME_WE)
add_dependencies(using_markers_generate_messages_cpp _using_markers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/obstacle_status.msg" NAME_WE)
add_dependencies(using_markers_generate_messages_cpp _using_markers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/Polygon.msg" NAME_WE)
add_dependencies(using_markers_generate_messages_cpp _using_markers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/environment.msg" NAME_WE)
add_dependencies(using_markers_generate_messages_cpp _using_markers_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(using_markers_gencpp)
add_dependencies(using_markers_gencpp using_markers_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS using_markers_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(using_markers
  "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/Point2D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/using_markers
)
_generate_msg_lisp(using_markers
  "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/obstacle_status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/using_markers
)
_generate_msg_lisp(using_markers
  "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/Polygon.msg"
  "${MSG_I_FLAGS}"
  "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/Point2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/using_markers
)
_generate_msg_lisp(using_markers
  "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/environment.msg"
  "${MSG_I_FLAGS}"
  "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/Point2D.msg;/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/Polygon.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/using_markers
)

### Generating Services

### Generating Module File
_generate_module_lisp(using_markers
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/using_markers
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(using_markers_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(using_markers_generate_messages using_markers_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/Point2D.msg" NAME_WE)
add_dependencies(using_markers_generate_messages_lisp _using_markers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/obstacle_status.msg" NAME_WE)
add_dependencies(using_markers_generate_messages_lisp _using_markers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/Polygon.msg" NAME_WE)
add_dependencies(using_markers_generate_messages_lisp _using_markers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/environment.msg" NAME_WE)
add_dependencies(using_markers_generate_messages_lisp _using_markers_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(using_markers_genlisp)
add_dependencies(using_markers_genlisp using_markers_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS using_markers_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(using_markers
  "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/Point2D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/using_markers
)
_generate_msg_py(using_markers
  "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/obstacle_status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/using_markers
)
_generate_msg_py(using_markers
  "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/Polygon.msg"
  "${MSG_I_FLAGS}"
  "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/Point2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/using_markers
)
_generate_msg_py(using_markers
  "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/environment.msg"
  "${MSG_I_FLAGS}"
  "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/Point2D.msg;/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/Polygon.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/using_markers
)

### Generating Services

### Generating Module File
_generate_module_py(using_markers
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/using_markers
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(using_markers_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(using_markers_generate_messages using_markers_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/Point2D.msg" NAME_WE)
add_dependencies(using_markers_generate_messages_py _using_markers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/obstacle_status.msg" NAME_WE)
add_dependencies(using_markers_generate_messages_py _using_markers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/Polygon.msg" NAME_WE)
add_dependencies(using_markers_generate_messages_py _using_markers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wall-e/Terry_ws/src/haptic-shared-control/using_markers/msg/environment.msg" NAME_WE)
add_dependencies(using_markers_generate_messages_py _using_markers_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(using_markers_genpy)
add_dependencies(using_markers_genpy using_markers_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS using_markers_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/using_markers)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/using_markers
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(using_markers_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(using_markers_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/using_markers)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/using_markers
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(using_markers_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(using_markers_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/using_markers)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/using_markers\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/using_markers
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(using_markers_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(using_markers_generate_messages_py geometry_msgs_generate_messages_py)
endif()
