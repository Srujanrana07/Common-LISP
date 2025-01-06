(defun is-prime (n)
  (if (or (< n 2) (= n 4))
      nil
      (not (some (lambda (x) (zerop (mod n x))) (loop for i from 2 to (sqrt n) collect i)))))

;; Example Usage:
(print(is-prime 7)) ;; Output: T
(print(is-prime 9))