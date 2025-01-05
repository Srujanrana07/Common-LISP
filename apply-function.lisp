(defun apply-function (fn lst)
  (mapcar fn lst))

;; Example Usage:
(print(apply-function #'1+ '(1 2 3)))