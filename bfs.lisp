(defun bfs (graph start)
  (let ((queue (list start))
        (visited nil))
    (loop while queue do
         (let ((node (pop queue)))
           (unless (member node visited)
             (push node visited)
             (setf queue (append queue (cdr (assoc node graph)))))))
    (reverse visited)))

;; Example Usage:
(print(bfs '((a b c) (b d e) (c f g) (d) (e) (f) (g)) 'a) )