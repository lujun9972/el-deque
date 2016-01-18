(require 'eieio)

(defclass deque ()
  ((content :accessor deque-content :protection :protected :documentation "The content of deque"))
  :abstract t)

(defgeneric deque-append (deque-data &rest elements)
  "Add elements to the right side of the deque.")

(defgeneric deque-append-left (deque-data &rest elements)
  "Add elemens to the left side of the deque.")

(defgeneric deque-clear (deque-data)
  "Remove all elements from the deque.")

(defgeneric deque-count (deque-data value)
  "Return number of occurrences of value.")

(defgeneric deque-extend (deque-data seq)
  "Extend the right side of the deque with elements from the SEQ.")

(defgeneric deque-extend-left (deque-data seq)
  "Extend the right side of the deque with elements from the SEQ.")

(defgeneric deque-empty-p (deque-data)
  "Wether the dequeu is empty")

(defgeneric deque-pop (deque-data)
  "Remove and return the rightmost element.")

(defgeneric deque-pop-left (deque-data)
  "Remove and return the leftmost element.")

(defgeneric deque-remove (deque-data value)
  "Remove first occurrence of VALUE.")

(defgeneric deque-reverse (deque-data)
  "reverse the deque.")

(defgeneric deque-rotate (deque-data &optional n)
  "Rotate the deque N steps to the right(default n=1). If n is negative,rotates left.")

(provide 'deque)
