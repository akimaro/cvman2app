(in-package :cl-user)
(defpackage cvman2app.model
  (:use :cl)
  (:import-from :cvman2app.config
		:config)
  (:export :get-cvman2app-sub-stats
	   :mdl1))
(in-package :cvman2app.model)
