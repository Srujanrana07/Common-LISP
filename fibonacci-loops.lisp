(defun fibonacci (n)
  (let ((a 0) (b 1))
    (dotimes (i n)
      (rotatef a b)
      (setf b (+ a b)))
    a))

;; Example Usage:
(print(fibonacci 6))