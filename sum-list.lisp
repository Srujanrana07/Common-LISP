(defun my-list-length (lst)
  "Returns the length of the list."
  (if (null lst)
      0                           ; If the list is empty, return 0
      (+ 1 (my-list-length (cdr lst))))) ; Otherwise, recursively count the length

;; Example usage:
(setq my-list '(1 2 3 4 5))   ; Define a list
(print (my-list-length my-list))