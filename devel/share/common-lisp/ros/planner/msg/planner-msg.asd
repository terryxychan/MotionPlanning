
(cl:in-package :asdf)

(defsystem "planner-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "manager_msgs" :depends-on ("_package_manager_msgs"))
    (:file "_package_manager_msgs" :depends-on ("_package"))
  ))