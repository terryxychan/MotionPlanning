
(cl:in-package :asdf)

(defsystem "geomagic_control-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "PhantomButtonEvent" :depends-on ("_package_PhantomButtonEvent"))
    (:file "_package_PhantomButtonEvent" :depends-on ("_package"))
    (:file "OmniFeedback" :depends-on ("_package_OmniFeedback"))
    (:file "_package_OmniFeedback" :depends-on ("_package"))
  ))