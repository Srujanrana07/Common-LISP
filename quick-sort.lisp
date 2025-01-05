(defun quicksort (lst)
  (if (null lst)
      '()
      (let ((pivot (car lst)))
        (append (quicksort (remove-if-not (lambda (x) (< x pivot)) (cdr lst)))
                (list pivot)
                (quicksort (remove-if-not (lambda (x) (>= x pivot)) (cdr lst)))))))

;; Example Usage:
(print(quicksort '(3 1 4 1 5 9)))