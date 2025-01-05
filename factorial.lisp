(defun factorial (n)
  (if (<= n 1)
      1
      (* n (factorial (- n 1)))))

;; Example Usage:
(factorial 5)