; Auto-generated. Do not edit!


(cl:in-package using_markers-msg)


;//! \htmlinclude Polygon.msg.html

(cl:defclass <Polygon> (roslisp-msg-protocol:ros-message)
  ((Polygon
    :reader Polygon
    :initarg :Polygon
    :type (cl:vector using_markers-msg:Point2D)
   :initform (cl:make-array 0 :element-type 'using_markers-msg:Point2D :initial-element (cl:make-instance 'using_markers-msg:Point2D))))
)

(cl:defclass Polygon (<Polygon>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Polygon>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Polygon)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name using_markers-msg:<Polygon> is deprecated: use using_markers-msg:Polygon instead.")))

(cl:ensure-generic-function 'Polygon-val :lambda-list '(m))
(cl:defmethod Polygon-val ((m <Polygon>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader using_markers-msg:Polygon-val is deprecated.  Use using_markers-msg:Polygon instead.")
  (Polygon m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Polygon>) ostream)
  "Serializes a message object of type '<Polygon>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'Polygon))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'Polygon))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Polygon>) istream)
  "Deserializes a message object of type '<Polygon>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'Polygon) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'Polygon)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'using_markers-msg:Point2D))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Polygon>)))
  "Returns string type for a message object of type '<Polygon>"
  "using_markers/Polygon")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Polygon)))
  "Returns string type for a message object of type 'Polygon"
  "using_markers/Polygon")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Polygon>)))
  "Returns md5sum for a message object of type '<Polygon>"
  "1808ec6af500892aa3059118b3e38f9f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Polygon)))
  "Returns md5sum for a message object of type 'Polygon"
  "1808ec6af500892aa3059118b3e38f9f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Polygon>)))
  "Returns full string definition for message of type '<Polygon>"
  (cl:format cl:nil "Point2D[] Polygon~%~%================================================================================~%MSG: using_markers/Point2D~%# this is a msg about Point2D~%float64 x~%float64 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Polygon)))
  "Returns full string definition for message of type 'Polygon"
  (cl:format cl:nil "Point2D[] Polygon~%~%================================================================================~%MSG: using_markers/Point2D~%# this is a msg about Point2D~%float64 x~%float64 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Polygon>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'Polygon) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Polygon>))
  "Converts a ROS message object to a list"
  (cl:list 'Polygon
    (cl:cons ':Polygon (Polygon msg))
))
