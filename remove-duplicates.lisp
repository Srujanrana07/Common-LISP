(defpackage :my-package
  (:use :common-lisp))

(in-package :my-package)

(defun my-remove-duplicates (lst)
  "Remove duplicates from a list."
  (let ((result '())   ; List to hold the result
        (seen '()))    ; List to keep track of seen elements
    (dolist (item lst)
      (unless (member item seen :test 'equal)  ; Check if item is already seen
        (push item result)                    ; Add item to result if not seen
        (push item seen)))                    ; Mark item as seen
    (nreverse result)))                        ; Reverse to maintain original order

;; Example usage
(let ((numbers '(5 3 8 1 2 3 5 7 2 8 1)))
  (format t "Original list: ~A~%" numbers)
  (format t "List without duplicates: ~A~%" (my-remove-duplicates numbers)))

