(defpackage :my-package
  (:use :common-lisp))

(in-package :my-package)

(defun average (lst)
  "Calculate the average of elements in LST."
  (if (null lst)
      (error "List is empty, cannot calculate average.")
      (let ((sum 0)
            (count 0))
        (dolist (item lst)
          (incf sum item)
          (incf count))
        (/ sum count))))

(defun filter-even-numbers (lst)
  "Filter even numbers from LST."
  (remove-if-not #'evenp lst))

(defun average-of-evens (lst)
  "Calculate the average of even numbers in LST."
  (let ((even-numbers (filter-even-numbers lst)))
    (average even-numbers)))

;; Example usage
(let ((my-list '(10 21 32 43 54 65 76)))
  (format t "Original list: ~A~%" my-list)
  (format t "Average of even numbers: ~A~%" (average-of-evens my-list)))

