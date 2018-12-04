# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "geomagic_control: 2 messages, 0 services")

set(MSG_I_FLAGS "-Igeomagic_control:/home/wall-e/Terry_ws/src/haptic-shared-control/geomagic_touch/geomagic_control/msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(geomagic_control_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/wall-e/Terry_ws/src/haptic-shared-control/geomagic_touch/geomagic_control/msg/OmniFeedback.msg" NAME_WE)
add_custom_target(_geomagic_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "geomagic_control" "/home/wall-e/Terry_ws/src/haptic-shared-control/geomagic_touch/geomagic_control/msg/OmniFeedback.msg" "geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/wall-e/Terry_ws/src/haptic-shared-control/geomagic_touch/geomagic_control/msg/PhantomButtonEvent.msg" NAME_WE)
add_custom_target(_geomagic_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "geomagic_control" "/home/wall-e/Terry_ws/src/haptic-shared-control/geomagic_touch/geomagic_control/msg/PhantomButtonEvent.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(geomagic_control
  "/home/wall-e/Terry_ws/src/haptic-shared-control/geomagic_touch/geomagic_control/msg/OmniFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/geomagic_control
)
_generate_msg_cpp(geomagic_control
  "/home/wall-e/Terry_ws/src/haptic-shared-control/geomagic_touch/geomagic_control/msg/PhantomButtonEvent.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/geomagic_control
)

### Generating Services

### Generating Module File
_generate_module_cpp(geomagic_control
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/geomagic_control
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(geomagic_control_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(geomagic_control_generate_messages geomagic_control_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wall-e/Terry_ws/src/haptic-shared-control/geomagic_touch/geomagic_control/msg/OmniFeedback.msg" NAME_WE)
add_dependencies(geomagic_control_generate_messages_cpp _geomagic_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wall-e/Terry_ws/src/haptic-shared-control/geomagic_touch/geomagic_control/msg/PhantomButtonEvent.msg" NAME_WE)
add_dependencies(geomagic_control_generate_messages_cpp _geomagic_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(geomagic_control_gencpp)
add_dependencies(geomagic_control_gencpp geomagic_control_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS geomagic_control_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(geomagic_control
  "/home/wall-e/Terry_ws/src/haptic-shared-control/geomagic_touch/geomagic_control/msg/OmniFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/geomagic_control
)
_generate_msg_lisp(geomagic_control
  "/home/wall-e/Terry_ws/src/haptic-shared-control/geomagic_touch/geomagic_control/msg/PhantomButtonEvent.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/geomagic_control
)

### Generating Services

### Generating Module File
_generate_module_lisp(geomagic_control
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/geomagic_control
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(geomagic_control_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(geomagic_control_generate_messages geomagic_control_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wall-e/Terry_ws/src/haptic-shared-control/geomagic_touch/geomagic_control/msg/OmniFeedback.msg" NAME_WE)
add_dependencies(geomagic_control_generate_messages_lisp _geomagic_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wall-e/Terry_ws/src/haptic-shared-control/geomagic_touch/geomagic_control/msg/PhantomButtonEvent.msg" NAME_WE)
add_dependencies(geomagic_control_generate_messages_lisp _geomagic_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(geomagic_control_genlisp)
add_dependencies(geomagic_control_genlisp geomagic_control_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS geomagic_control_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(geomagic_control
  "/home/wall-e/Terry_ws/src/haptic-shared-control/geomagic_touch/geomagic_control/msg/OmniFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/geomagic_control
)
_generate_msg_py(geomagic_control
  "/home/wall-e/Terry_ws/src/haptic-shared-control/geomagic_touch/geomagic_control/msg/PhantomButtonEvent.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/geomagic_control
)

### Generating Services

### Generating Module File
_generate_module_py(geomagic_control
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/geomagic_control
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(geomagic_control_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(geomagic_control_generate_messages geomagic_control_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wall-e/Terry_ws/src/haptic-shared-control/geomagic_touch/geomagic_control/msg/OmniFeedback.msg" NAME_WE)
add_dependencies(geomagic_control_generate_messages_py _geomagic_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wall-e/Terry_ws/src/haptic-shared-control/geomagic_touch/geomagic_control/msg/PhantomButtonEvent.msg" NAME_WE)
add_dependencies(geomagic_control_generate_messages_py _geomagic_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(geomagic_control_genpy)
add_dependencies(geomagic_control_genpy geomagic_control_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS geomagic_control_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/geomagic_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/geomagic_control
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(geomagic_control_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/geomagic_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/geomagic_control
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(geomagic_control_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/geomagic_control)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/geomagic_control\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/geomagic_control
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(geomagic_control_generate_messages_py geometry_msgs_generate_messages_py)
endif()
