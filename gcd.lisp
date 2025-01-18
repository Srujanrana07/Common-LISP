(defun my-gcd (a b)
  (if (zerop b)
      a
      (my-gcd b (mod a b))))

;; Example usage:
(format t "GCD of 48 and 18 is: ~A~%" (my-gcd 48 18))

