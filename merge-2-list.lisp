(defun merge-sorted-lists (lst1 lst2)
  (cond
    ((null lst1) lst2)
    ((null lst2) lst1)
    ((<= (car lst1) (car lst2))
     (cons (car lst1) (merge-sorted-lists (cdr lst1) lst2)))
    (t
     (cons (car lst2) (merge-sorted-lists lst1 (cdr lst2))))))

;; Example Usage:
(print(merge-sorted-lists '(1 3 5) '(2 4 6)))