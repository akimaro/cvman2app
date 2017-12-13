(defsystem "cvman2app-test"
  :defsystem-depends-on ("prove-asdf")
  :author "akimaro"
  :license ""
  :depends-on ("cvman2app"
               "prove")
  :components ((:module "tests"
                :components
                ((:test-file "cvman2app"))))
  :description "Test system for cvman2app"
  :perform (test-op (op c) (symbol-call :prove-asdf :run-test-system c)))
