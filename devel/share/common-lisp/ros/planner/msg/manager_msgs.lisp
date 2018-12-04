; Auto-generated. Do not edit!


(cl:in-package planner-msg)


;//! \htmlinclude manager_msgs.msg.html

(cl:defclass <manager_msgs> (roslisp-msg-protocol:ros-message)
  ((flag
    :reader flag
    :initarg :flag
    :type cl:boolean
    :initform cl:nil)
   (radius
    :reader radius
    :initarg :radius
    :type cl:float
    :initform 0.0)
   (obs_x
    :reader obs_x
    :initarg :obs_x
    :type cl:float
    :initform 0.0)
   (obs_y
    :reader obs_y
    :initarg :obs_y
    :type cl:float
    :initform 0.0)
   (agent_x
    :reader agent_x
    :initarg :agent_x
    :type cl:float
    :initform 0.0)
   (agent_y
    :reader agent_y
    :initarg :agent_y
    :type cl:float
    :initform 0.0))
)

(cl:defclass manager_msgs (<manager_msgs>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <manager_msgs>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'manager_msgs)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name planner-msg:<manager_msgs> is deprecated: use planner-msg:manager_msgs instead.")))

(cl:ensure-generic-function 'flag-val :lambda-list '(m))
(cl:defmethod flag-val ((m <manager_msgs>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader planner-msg:flag-val is deprecated.  Use planner-msg:flag instead.")
  (flag m))

(cl:ensure-generic-function 'radius-val :lambda-list '(m))
(cl:defmethod radius-val ((m <manager_msgs>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader planner-msg:radius-val is deprecated.  Use planner-msg:radius instead.")
  (radius m))

(cl:ensure-generic-function 'obs_x-val :lambda-list '(m))
(cl:defmethod obs_x-val ((m <manager_msgs>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader planner-msg:obs_x-val is deprecated.  Use planner-msg:obs_x instead.")
  (obs_x m))

(cl:ensure-generic-function 'obs_y-val :lambda-list '(m))
(cl:defmethod obs_y-val ((m <manager_msgs>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader planner-msg:obs_y-val is deprecated.  Use planner-msg:obs_y instead.")
  (obs_y m))

(cl:ensure-generic-function 'agent_x-val :lambda-list '(m))
(cl:defmethod agent_x-val ((m <manager_msgs>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader planner-msg:agent_x-val is deprecated.  Use planner-msg:agent_x instead.")
  (agent_x m))

(cl:ensure-generic-function 'agent_y-val :lambda-list '(m))
(cl:defmethod agent_y-val ((m <manager_msgs>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader planner-msg:agent_y-val is deprecated.  Use planner-msg:agent_y instead.")
  (agent_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <manager_msgs>) ostream)
  "Serializes a message object of type '<manager_msgs>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'flag) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'radius))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'obs_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'obs_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'agent_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'agent_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <manager_msgs>) istream)
  "Deserializes a message object of type '<manager_msgs>"
    (cl:setf (cl:slot-value msg 'flag) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'radius) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'obs_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'obs_y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'agent_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'agent_y) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<manager_msgs>)))
  "Returns string type for a message object of type '<manager_msgs>"
  "planner/manager_msgs")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'manager_msgs)))
  "Returns string type for a message object of type 'manager_msgs"
  "planner/manager_msgs")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<manager_msgs>)))
  "Returns md5sum for a message object of type '<manager_msgs>"
  "ac5a6f3bc967fa7c59d9fce13690555f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'manager_msgs)))
  "Returns md5sum for a message object of type 'manager_msgs"
  "ac5a6f3bc967fa7c59d9fce13690555f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<manager_msgs>)))
  "Returns full string definition for message of type '<manager_msgs>"
  (cl:format cl:nil "# this is a msg from the manager~%bool flag~%float64 radius~%float64 obs_x~%float64 obs_y~%float64 agent_x~%float64 agent_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'manager_msgs)))
  "Returns full string definition for message of type 'manager_msgs"
  (cl:format cl:nil "# this is a msg from the manager~%bool flag~%float64 radius~%float64 obs_x~%float64 obs_y~%float64 agent_x~%float64 agent_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <manager_msgs>))
  (cl:+ 0
     1
     8
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <manager_msgs>))
  "Converts a ROS message object to a list"
  (cl:list 'manager_msgs
    (cl:cons ':flag (flag msg))
    (cl:cons ':radius (radius msg))
    (cl:cons ':obs_x (obs_x msg))
    (cl:cons ':obs_y (obs_y msg))
    (cl:cons ':agent_x (agent_x msg))
    (cl:cons ':agent_y (agent_y msg))
))
