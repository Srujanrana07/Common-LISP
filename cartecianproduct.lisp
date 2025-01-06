(defun dot-product (a b)
  "Computes the dot product of two lists a and b."
  (if (and a b)
      (reduce #'+ (mapcar #'* a b))
      0))  ;; Return 0 if lists are empty or of unequal lengths
(defun element-wise-product (a b)
  "Computes the element-wise product (Hadamard product) of two lists a and b."


  (mapcar #'* a b))
;; Example vectors
(setq A '(1 2 3))
(setq B '(4 5 6))

;; Compute dot product
(print (dot-product A B))  ;; Output: 32  (1*4 + 2*5 + 3*6)

;; Compute element-wise product
(print (element-wise-product A B))  ;; Output: (4 10 18)  (1*4, 2*5, 3*6)


