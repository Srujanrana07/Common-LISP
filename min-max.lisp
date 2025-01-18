(defun find-min-max (lst)
  (if (null lst)
      (error "The list is empty.")  ; Handle empty list case
      (let ((min (first lst))
            (max (first lst)))
        (dolist (item (rest lst))
          (when (< item min)
            (setf min item))
          (when (> item max)
            (setf max item)))
        (values min max))))  ; Return both min and max

;; Example usage:
(let ((numbers '(5 3 8 1 2 7)))
  (multiple-value-bind (min max) (find-min-max numbers)
    (format t "List: ~A~%" numbers)
    (format t "Minimum: ~A~%" min)
    (format t "Maximum: ~A~%" max)))

