(defpackage :tsp
  (:use :common-lisp))

(in-package :tsp)

(defun total-distance (route distance-matrix)
  "Calculate the total distance of the given route based on the distance matrix."
  (let ((total 0))
    (dotimes (i (1- (length route)))
      (setf total (+ total (aref distance-matrix (nth i route) (nth (1+ i) route)))))
    ;; Return to the starting city
    (+ total (aref distance-matrix (nth (1- (length route)) route) (nth 0 route)))))

(defun permutations (lst)
  "Generate all permutations of the list."
  (if (null lst)
      (list nil)
      (apply #'append
             (mapcar (lambda (x)
                       (mapcar (lambda (p)
                                 (cons (first lst) p))
                               (permutations (remove x lst))))
                     lst))))

(defun tsp (distance-matrix)
  "Solve the Traveling Salesman Problem using brute force."
  (let* ((cities (loop for i below (array-dimension distance-matrix 0) collect i))
         (all-routes (permutations cities))
         (shortest-route nil)
         (min-distance most-positive-fixnum))
    (dolist (route all-routes)
      (let ((dist (total-distance route distance-matrix)))
        (when (< dist min-distance)
          (setf min-distance dist)
          (setf shortest-route route))))
    (values shortest-route min-distance)))

;; Example usage
(let* ((distance-matrix (make-array '(4 4) :element-type 'integer :initial-contents '((0 10 15 20)
                                                                                     (10 0 35 25)
                                                                                     (15 35 0 30)
                                                                                     (20 25 30 0))))
       (route nil))
  (multiple-value-bind (best-route best-distance) (tsp distance-matrix)
    (format t "Best route: ~A~%" best-route)
    (format t "Minimum distance: ~A~%" best-distance)))

