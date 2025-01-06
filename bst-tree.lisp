;; Define the structure of a node in the BST
(defstruct node key left right)

;; Function to insert a key into the BST
(defun insert-bst (tree key)
  (if tree
      (if (< key (node-key tree))
          (make-node :key (node-key tree)
                     :left (insert-bst (node-left tree) key)
                     :right (node-right tree))
          (make-node :key (node-key tree)
                     :left (node-left tree)
                     :right (insert-bst (node-right tree) key)))
      (make-node :key key)))

;; Function to search for a key in the BST
(defun search-bst (tree key)
  (cond
    ((null tree) nil) ;; Key not found
    ((= key (node-key tree)) t) ;; Key found
    ((< key (node-key tree)) 
     (search-bst (node-left tree) key)) ;; Search in the left subtree
    ((> key (node-key tree)) 
     (search-bst (node-right tree) key)))) ;; Search in the right subtree

;; Function to print the BST in-order for visualization
(defun inorder-traversal (tree)
  "Perform an in-order traversal of the BST and return a sorted list of keys."
  (when tree
    (append 
      (inorder-traversal (node-left tree)) ;; Traverse left subtree
      (list (node-key tree))              ;; Visit root node
      (inorder-traversal (node-right tree))))) ;; Traverse right subtree

;; Example Usage:
(let ((tree nil)) ;; Start with an empty BST
  ;; Insert elements into the BST
  (setf tree (insert-bst tree 10))
  (setf tree (insert-bst tree 5))
  (setf tree (insert-bst tree 15))
  (setf tree (insert-bst tree 3))
  (setf tree (insert-bst tree 7))
  ;; Print the BST using in-order traversal
  (print "In-order Traversal of BST:")
  (print (inorder-traversal tree))
  
  ;; Search for keys in the BST
  (print "Searching for key 7:")
  (print (search-bst tree 7)) ;; Should return T
  
  (print "Searching for key 20:")
  (print (search-bst tree 20))) ;; Should return NIL
