(defun reverse-list (lst)
  (labels ((helper (lst acc)
             (if (null lst)
                 acc
                 (helper (cdr lst) (cons (car lst) acc)))))
    (helper lst '())))

;; Example Usage:
(print(reverse-list '(1 2 3 4)))