(defpackage :eight-queens
  (:use :common-lisp))

(in-package :eight-queens)

(defun safe? (queen row col)
  "Check if placing a queen at (row, col) is safe from other queens."
  (not (or (member row (mapcar #'car queen))  ; Check for same row
           (member col (mapcar #'cdr queen))  ; Check for same column
           (some (lambda (q)
                   (let ((r (car q))
                         (c (cdr q)))
                     (= (abs (- r row)) (abs (- c col)))))  ; Check for diagonals
                 queen))))

(defun place-queens (n &optional (queen '()))
  "Place queens on the board recursively."
  (if (= (length queen) n)
      (list queen)  ; Found a solution
      (apply #'append
             (loop for col from 0 below n
                   when (safe? queen (length queen) col)
                   collect (place-queens n (append queen (list (cons (length queen) col))))))))

(defun solve-eight-queens ()
  "Solve the 8-Queens problem and print all solutions."
  (let ((solutions (place-queens 8)))
    (format t "Total solutions: ~A~%" (length solutions))
    (dolist (sol solutions)
      (format t "~A~%" sol))))

;; To run the solver
(solve-eight-queens)

