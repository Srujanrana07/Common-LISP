(defun binary-search (lst target)
  "Perform binary search on a sorted list 'lst' to find 'target'.
Returns the index of the target if found, or NIL if not found."
  (labels ((binary-search-helper (lst left right)
             (if (> left right)
                 nil  ; Target not found
                 (let* ((mid (floor (+ left right) 2))
                        (mid-val (nth mid lst)))
                   (cond ((= mid-val target) mid)  ; Target found
                         ((< target mid-val) (binary-search-helper lst left (1- mid))) ; Search left half
                         (t (binary-search-helper lst (1+ mid) right))))))) ; Search right half
    (binary-search-helper lst 0 (1- (length lst)))))

;; Example usage:
(let ((sorted-list '(1 3 5 7 9 11 13)))
  (print (binary-search sorted-list 7))   ; Output: 3
  (print (binary-search sorted-list 2))) ; Output: NIL
