;; Define a set-union function (Union of two sets)
(defun my-set-union (a b)
  (remove-duplicates (append a b)))

;; Define a set-intersection function (Intersection of two sets)
(defun my-set-intersection (a b)
  (remove-if-not (lambda (x) (member x b)) a))

;; Define a set-difference function (Difference of two sets)
(defun my-set-difference (a b)
  (remove-if (lambda (x) (member x b)) a))

;; Example Usage:
(print (my-set-union '(1 2 3) '(3 4 5)))           ;; Output: (1 2 3 4 5)
(print (my-set-intersection '(1 2 3) '(3 4 5)))    ;; Output: (3)
(print (my-set-difference '(1 2 3) '(3 4 5)))      ;; Output: (1 2)
