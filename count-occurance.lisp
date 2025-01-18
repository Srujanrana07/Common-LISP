(defpackage :my-package
  (:use :common-lisp))

(in-package :my-package)

(defun count-occurrences (lst element)
  "Count the number of times ELEMENT appears in LST."
  (let ((count 0))  ; Initialize count to zero
    (dolist (item lst)
      (when (equal item element)  ; Check if the current item matches the element
        (incf count)))           ; Increment count if it matches
    count))                     ; Return the final count

;; Example usage
(let ((my-list '(1 2 3 2 1 4 2 5 1 6 1))
      (element-to-count 1))
  (format t "Original list: ~A~%" my-list)
  (format t "Element ~A appears ~A times.~%" element-to-count (count-occurrences my-list element-to-count)))

