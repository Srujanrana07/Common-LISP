(defpackage :my-package
  (:use :common-lisp))

(in-package :my-package)

(defun average (lst)
  "Calculate the average of elements in LST."
  (if (null lst)  ; Check if the list is empty
      (error "List is empty, cannot calculate average.")
      (let ((sum 0)
            (count 0))
        (dolist (item lst)
          (incf sum item)  ; Add each item to sum
          (incf count))     ; Increment the count
        (/ sum count))))    ; Divide sum by count to get the average

;; Example usage
(let ((my-list '(10 20 30 40 50)))
  (format t "Original list: ~A~%" my-list)
  (format t "Average: ~A~%" (average my-list)))

