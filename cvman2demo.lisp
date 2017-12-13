(defparameter *web* (make-instance 'cvman2app))

@route GET "/"
(defun index ()
  (render #P"index.tmpl"))

@route GET "/hello"
(defun say-hello (&key (|name| "Guest"))
  (format nil "Hello, ~A" |name|))
