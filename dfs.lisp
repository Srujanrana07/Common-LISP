;; Function to perform DFS from a given node
(defun dfs-util (graph node visited)
  "Helper function for Depth-First Search. Visits nodes recursively."
  (unless (member node visited) ;; If the node has not been visited
    (progn
      ;; Process the current node (e.g., print it)
      (print node)
      ;; Add the current node to the visited list
      (push node visited)
      ;; Explore all neighbors of the current node
      (dolist (neighbor (cdr (assoc node graph)))
        ;; Recursively visit neighbors
        (dfs-util graph neighbor visited)))
    visited)) ;; Return the updated visited list

;; Main DFS function
(defun dfs (graph start-node)
  "Performs Depth-First Search on the given graph starting from start-node."
  (dfs-util graph start-node '()))

;; Example Graph Representation
;; The graph is represented as an adjacency list.
;; Each element is a pair where the car is a node, and the cdr is a list of neighbors.
(setq graph '((1 . (2 3))  ;; Node 1 has neighbors 2 and 3
              (2 . (4 5))  ;; Node 2 has neighbors 4 and 5
              (3 . ())     ;; Node 3 has no neighbors
              (4 . ())     ;; Node 4 has no neighbors
              (5 . ())))   ;; Node 5 has no neighbors

;; Example Usage:
(print "DFS Traversal Starting from Node 1:")
(dfs graph 1)