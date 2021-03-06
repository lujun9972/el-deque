(require 'ert)
(require 'deque-list)
(ert-deftest deque-test-append ()
  ""
  (let ((a (make-instance 'deque-list :content '(a))))
    (deque-append a 'b 'c)
    (should (equal (deque-content a)
                   '(a b c)))))

(ert-deftest deque-test-append-left ()
  ""
  (let ((a (make-instance 'deque-list :content '(a))))
    (deque-append-left a 'b 'c)
    (should (equal (deque-content a)
                   '(b c a)))))

(ert-deftest deque-test-clear ()
  ""
  (let ((a (make-instance 'deque-list :content '(a))))
    (deque-clear a)
    (should (equal (deque-content a)
                   nil))))

(ert-deftest deque-test-count ()
  ""
  (let ((deque-data (make-instance 'deque-list :content '(a b c a b))))
    (should (= (deque-count deque-data 'a)
               2))))

(ert-deftest deque-test-extend ()
  ""
  (let ((deque-data (make-instance 'deque-list)))
    (deque-extend deque-data "ababc")
    (should (equal (deque-content deque-data)
                   '(?a ?b ?a ?b ?c)))))

(ert-deftest deque-test-extend-left ()
  ""
  (let ((deque-data (make-instance 'deque-list :content '(?d))))
    (deque-extend-left deque-data "ababc")
    (should (equal (deque-content deque-data)
                   '(?a ?b ?a ?b ?c ?d)))))

(ert-deftest deque-test-pop ()
  ""
  (let ((deque-data (make-instance 'deque-list :content '(?d))))
    (deque-extend-left deque-data "ababc")
    (should (equal (deque-content deque-data)
                   '(?a ?b ?a ?b ?c ?d)))))

(ert-deftest deque-test-empty-p ()
  ""
  (let ((deque-data (make-instance 'deque-list)))
    (should (deque-empty-p deque-data))))

(ert-deftest deque-test-pop ()
  ""
  (let ((deque-data (make-instance 'deque-list)))
    (should-error (deque-pop deque-data))
    (deque-append deque-data "a" "b" "c")
    (should (equal (deque-pop deque-data)
                   "c"))
    (should (equal (deque-pop deque-data)
                   "b"))
    (should (equal (deque-pop deque-data)
                   "a"))
    (should-error (deque-pop deque-data))))

(ert-deftest deque-test-pop-left ()
  ""
  (let ((deque-data (make-instance 'deque-list)))
    (should-error (deque-pop-left deque-data))
    (deque-append deque-data "a" "b" "c")
    (should (equal (deque-pop-left deque-data)
                   "a"))
    (should (equal (deque-pop-left deque-data)
                   "b"))
    (should (equal (deque-pop-left deque-data)
                   "c"))
    (should-error (deque-pop-left deque-data))))

(ert-deftest deque-test-remove ()
  ""
  (let ((deque-data (make-instance 'deque-list)))
    (deque-append deque-data "a" "b" "c" "b")
    (deque-remove deque-data "b")
    (should (equal (deque-content deque-data)
                   '("a" "c" "b")))
    (deque-remove deque-data "b")
    (should (equal (deque-content deque-data)
                   '("a" "c")))
    (deque-remove deque-data "a")
    (should (equal (deque-content deque-data)
                   '("c")))
    (deque-remove deque-data "a")
    (should (equal (deque-content deque-data)
                   '("c")))
    (deque-remove deque-data "c")
    (should (equal (deque-content deque-data)
                   nil))
    (deque-remove deque-data "c")
    (should (equal (deque-content deque-data)
                   nil))))

(ert-deftest deque-test-reverse ()
  ""
  (let ((deque-data (make-instance 'deque-list)))
    (deque-reverse deque-data)
    (should (equal (deque-content deque-data)
                   nil))
    (deque-append deque-data "a")
    (deque-reverse deque-data)
    (should (equal (deque-content deque-data)
                   '("a")))
    (deque-append deque-data "b")
    (deque-reverse deque-data)
    (should (equal (deque-content deque-data)
                   '("b" "a")))
    (deque-append deque-data "c")
    (deque-reverse deque-data)
    (should (equal (deque-content deque-data)
                   '("c" "a" "b")))))

(ert-deftest deque-test-rotate ()
  ""
  (let ((deque-data (make-instance 'deque-list)))
    (deque-append deque-data "a" "b" "c")
    (deque-rotate deque-data)
    (should (equal (deque-content deque-data)
                   '("c" "a" "b")))
    (deque-rotate deque-data 2)
    (should (equal (deque-content deque-data)
                   '("a" "b" "c")))
    (deque-rotate deque-data -1)
    (should (equal (deque-content deque-data)
                   '("b" "c" "a")))))
