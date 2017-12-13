(in-package :cl-user)
(defpackage cvman2app.web
  (:use :cl
        :caveman2
        :cvman2app.config
        :cvman2app.view
	:cvman2app.model
        :cvman2app.db
	:cvman2app.page
        :datafly
        :sxql)
  (:export :*web*))
(in-package :cvman2app.web)

;; for @route annotation
(syntax:use-syntax :annot)

;;
;; Application

(defclass <web> (<app>) ())
(defvar *web* (make-instance '<web>))
(clear-routing-rules *web*)

;;
;; Routing rules

(defroute "/" ()
  (indexpage2))
(defroute "/b" ()
  (redirect (format nil "/a/~A" (+ 4 3))))

(defroute "/a/?:p1?" (&key (p1 "Guest"))
  (with-html-output-to-string (output nil :prologue t)
    (:html
     (:head (:title "Welcome to test A page."))
     (:body
      (:p :style "font-size:30;"
	  (format output "cl-who testing: param :p1 is ~A" p1))))))
(defroute "/test/*" (&key splat)
  (format nil "URL: ~a" (car splat)))

;;
;; Error pages

(defmethod on-exception ((app <web>) (code (eql 404)))
  (declare (ignore app))
  (merge-pathnames #P"_errors/404.html"
                   *template-directory*))
