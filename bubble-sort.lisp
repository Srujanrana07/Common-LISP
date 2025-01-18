(defun bubble-sort (list)
  (let ((swapped t)
        (sorted-list (copy-list list)))  ; Make a copy of the list
    (loop while swapped do
      (setf swapped nil)  ; Reset swapped to false
      (loop for i from 0 to (1- (length sorted-list))
            do (when (and (< i (1- (length sorted-list)))
                          (> (nth i sorted-list) (nth (1+ i) sorted-list)))
                 (rotatef (nth i sorted-list) (nth (1+ i) sorted-list))  ; Swap
                 (setf swapped t))))  ; Set swapped to true if a swap occurred
    sorted-list))  ; Return the sorted list

;; Example usage:
(let ((unsorted-list '(5 3 8 1 2 7)))
  (format t "Original list: ~A~%" unsorted-list)
  (format t "Sorted list: ~A~%" (bubble-sort unsorted-list)))

