(defun dijkstra (graph source)
  "Perform Dijkstra's algorithm to find the shortest paths from the source node.
   - graph: An adjacency list representation of the graph, where each node is associated with its neighbors and edge weights.
   - source: The starting node."
  (let* ((distances (make-hash-table)) ;; Stores shortest distances from source to each node
         (visited (make-hash-table))   ;; Tracks visited nodes
         (priority-queue (list (list source 0)))) ;; Priority queue as a list of (node distance)

    ;; Initialize distances to infinity for all nodes except the source
    (dolist (node (mapcar #'car graph))
      (setf (gethash node distances) most-positive-fixnum))
    (setf (gethash source distances) 0)

    ;; Main loop: process nodes in the priority queue
    (loop while priority-queue do
          ;; Get the node with the smallest distance from the queue
          (let* ((current-entry (car priority-queue))
                 (current-node (first current-entry))
                 (current-distance (second current-entry)))
            ;; Remove it from the queue
            (setf priority-queue (cdr priority-queue))

            ;; Skip if already visited
            (unless (gethash current-node visited)
              ;; Mark as visited
              (setf (gethash current-node visited) t)

              ;; Update distances for neighbors
              (dolist (neighbor-entry (cdr (assoc current-node graph)))
                (let ((neighbor-node (first neighbor-entry))
                      (edge-weight (second neighbor-entry)))
                  ;; Calculate new distance
                  (let ((new-distance (+ current-distance edge-weight)))
                    ;; If new distance is shorter, update it
                    (when (< new-distance (gethash neighbor-node distances))
                      (setf (gethash neighbor-node distances) new-distance)
                      ;; Add neighbor to the priority queue with its updated distance
                      (push (list neighbor-node new-distance) priority-queue)))))))

          ;; Sort the priority queue by distance to simulate a min-priority queue
          (setf priority-queue 
                (sort priority-queue #'< :key #'second)))

    ;; Return distances as a hash table
    distances))

;; Example Graph Representation:
;; The graph is represented as an adjacency list.
;; Each node is associated with its neighbors and edge weights.
(defparameter graph
  '((a . ((b 1) (c 4)))  ;; Node A has neighbors B with weight 1 and C with weight 4
    (b . ((c 2) (d 6)))  ;; Node B has neighbors C with weight 2 and D with weight 6
    (c . ((d 3)))        ;; Node C has neighbor D with weight 3
    (d . ())             ;; Node D has no neighbors
    ))

;; Example Usage:
(let ((distances (dijkstra graph 'a)))
  ;; Print shortest distances from source node A to all other nodes
  (maphash #'(lambda (node distance)
               (format t "Shortest distance from A to a: ~a%" node distance))
           distances))