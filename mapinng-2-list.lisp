(defun check-mapping (fn &rest lists)
  (apply #'mapcar fn lists))

;; Example Usage:
(print(check-mapping #'+ '(1 2 3) '(4 5 6)))