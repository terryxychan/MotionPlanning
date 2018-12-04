
(cl:in-package :asdf)

(defsystem "using_markers-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "Polygon" :depends-on ("_package_Polygon"))
    (:file "_package_Polygon" :depends-on ("_package"))
    (:file "PhantomButtonEvent" :depends-on ("_package_PhantomButtonEvent"))
    (:file "_package_PhantomButtonEvent" :depends-on ("_package"))
    (:file "obstacle_status" :depends-on ("_package_obstacle_status"))
    (:file "_package_obstacle_status" :depends-on ("_package"))
    (:file "Point2D" :depends-on ("_package_Point2D"))
    (:file "_package_Point2D" :depends-on ("_package"))
    (:file "environment" :depends-on ("_package_environment"))
    (:file "_package_environment" :depends-on ("_package"))
    (:file "OmniFeedback" :depends-on ("_package_OmniFeedback"))
    (:file "_package_OmniFeedback" :depends-on ("_package"))
  ))