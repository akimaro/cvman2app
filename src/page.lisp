;(use-package '(:cvman2app.web :cl-who :parenscript))
(in-package :cl-user)
(defpackage cvman2app.page
  (:use :cl-who
	:parenscript)
  (:export :indexpage2))
(in-package :cvman2app.page)

(defun indexpage2 ()
  (with-html-output-to-string (output nil :prologue t)
    (:html
     (:head (:meta :charset="utf-8")
	    (:title "Test Index Page")
	    (:meta :name "viewport" :content "width=device-width, initial-scale=1")
	    (:link :rel "stylesheet" :href "http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css")
	    (:script :src "http://code.jquery.com/jquery-3.2.1.min.js")
	    (:script :src "http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"))
     (:body
      (:div :data-role "page"
	    (:div :data-role "header"
		  (:h1 "HEADER"))
	    (:div :data-role "main" :class "ui-content"
		  (:h2 "CONTENT")
		  (:p "testing"))
	    (:div :data-role "footer"
		  (:h3 "FOOTER")))))))
