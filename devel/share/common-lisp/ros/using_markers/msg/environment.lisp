; Auto-generated. Do not edit!


(cl:in-package using_markers-msg)


;//! \htmlinclude environment.msg.html

(cl:defclass <environment> (roslisp-msg-protocol:ros-message)
  ((Obstacles
    :reader Obstacles
    :initarg :Obstacles
    :type (cl:vector using_markers-msg:Polygon)
   :initform (cl:make-array 0 :element-type 'using_markers-msg:Polygon :initial-element (cl:make-instance 'using_markers-msg:Polygon))))
)

(cl:defclass environment (<environment>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <environment>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'environment)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name using_markers-msg:<environment> is deprecated: use using_markers-msg:environment instead.")))

(cl:ensure-generic-function 'Obstacles-val :lambda-list '(m))
(cl:defmethod Obstacles-val ((m <environment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader using_markers-msg:Obstacles-val is deprecated.  Use using_markers-msg:Obstacles instead.")
  (Obstacles m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <environment>) ostream)
  "Serializes a message object of type '<environment>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'Obstacles))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'Obstacles))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <environment>) istream)
  "Deserializes a message object of type '<environment>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'Obstacles) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'Obstacles)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'using_markers-msg:Polygon))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<environment>)))
  "Returns string type for a message object of type '<environment>"
  "using_markers/environment")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'environment)))
  "Returns string type for a message object of type 'environment"
  "using_markers/environment")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<environment>)))
  "Returns md5sum for a message object of type '<environment>"
  "0dbb5e5297239549b759daf57f6ebd35")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'environment)))
  "Returns md5sum for a message object of type 'environment"
  "0dbb5e5297239549b759daf57f6ebd35")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<environment>)))
  "Returns full string definition for message of type '<environment>"
  (cl:format cl:nil "# this msg of environment is the information that is used as obstacles~%Polygon[] Obstacles~%~%================================================================================~%MSG: using_markers/Polygon~%Point2D[] Polygon~%~%================================================================================~%MSG: using_markers/Point2D~%# this is a msg about Point2D~%float64 x~%float64 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'environment)))
  "Returns full string definition for message of type 'environment"
  (cl:format cl:nil "# this msg of environment is the information that is used as obstacles~%Polygon[] Obstacles~%~%================================================================================~%MSG: using_markers/Polygon~%Point2D[] Polygon~%~%================================================================================~%MSG: using_markers/Point2D~%# this is a msg about Point2D~%float64 x~%float64 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <environment>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'Obstacles) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <environment>))
  "Converts a ROS message object to a list"
  (cl:list 'environment
    (cl:cons ':Obstacles (Obstacles msg))
))
