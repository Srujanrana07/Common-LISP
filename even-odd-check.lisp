(defun is-even (n)
  (if (zerop n)
      t
      (is-odd (- n 1))))

(defun is-odd (n)
  (if (zerop n)
      nil
      (is-even (- n 1))))

;; Example Usage:
(print(is-even 4)) ;; Output: T
(print(is-odd 4))