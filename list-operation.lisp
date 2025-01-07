(defun list-operations ()
  (let ((my-list '(1 2 3 4 5)))
    (format t "Original list: ~a~%" my-list)
    (format t "Length: ~a~%" (length my-list))
    (format t "First element: ~a~%" (first my-list))
    (format t "Last element: ~a~%" (last my-list))
    (format t "Reversed list: ~a~%" (reverse my-list))))

;; Example Usage:
(print(list-operations))