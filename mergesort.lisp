
;; Function to merge two sorted lists
(defun my-merge (left right)
  (cond
    ((null left) right) ;; If left list is empty, return right
    ((null right) left) ;; If right list is empty, return left
    ((<= (car left) (car right)) ;; Compare the first elements of both lists
     (cons (car left) (my-merge (cdr left) right))) ;; Add smaller element to result
    (t
     (cons (car right) (my-merge left (cdr right)))))) ;; Add smaller element to result

;; Function to perform merge sort on a list
(defun merge-sort (lst)
  (if (< (length lst) 2) ;; Base case: if the list has 0 or 1 element, it is already sorted
      lst
      ;; Split the list into two halves and recursively sort them
      (let* ((mid (floor (/ (length lst) 2))) ;; Ensure mid is an integer
             (left (subseq lst 0 mid)) ;; Left half of the list
             (right (subseq lst mid))) ;; Right half of the list
        ;; Merge the two sorted halves using my-merge
        (my-merge (merge-sort left) (merge-sort right)))))

;; Example Usage:
(print "Sorting List: '(5 2 9 1 5 6)")
(print "Sorted Result:")
(print (merge-sort '(5 2 9 1 5 6)))