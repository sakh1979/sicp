;;; Exercise 1.1
;;; Below is a sequence of expressions. What is the result printed by the
;;; interpreter in response to each expression? Assume that the sequence is to
;;; be evaluated in the order in which it is presented.
;;; 10                                      => 10
;;; (+ 5 3 4)                               => 12
;;; (- 9 1)                                 => 8
;;; (/ 6 2)                                 => 3
;;; (+ (* 2 4) (- 4 6))                     => 6
;;; (define a 3)                            => a = 3
;;; (define b (+ a 1))                      => b = 4
;;; (+ a b (* a b))                         => 19
;;; (= a b)                                 => #f
;;; (if (and (> b a) (< b (* a b)))         => 4
;;;     b
;;;     a)
;;; (cond ((= a 4) 6)                       => 16
;;;       ((= b 4) (+ 6 7 a))
;;;       (else 25))
;;; (+ 2 (if (> b a) b a))                  => 6
;;; (* (cond ((> a b) a)                    => 16
;;;          ((< a b) b)
;;;          (else -1))
;;;    (+ a 1))


;;; Exercise 1.2
;;; Translate the following expression into prefix form
;;; Answer => -37/150
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
    (* 3 (- 6 2) (- 2 7)))


;;; Exercise 1.3
;;; Define a procedure that takes three numbers as arguments and returns the
;;; sum of the squares of the two larger numbers.
(define (square x) (* x x))
(define (sum-of-square x y)
  (+ (square x) (square y)))
(define (largest-sum-of-square a b c)
  (cond ((= a (max a b)) (sum-of-square a (max b c)))
        ((= b (max a b)) (sum-of-square b (max a c)))))


;;; Exercise 1.4
;;; Observe that our model of evaluation allows for combinations whose 
;;; operators are compound expressions. Use this observation to 
;;; describe the behavior of the following procedure
;;; (define (a-plus-abs-b a b)
;;;   ((if (> b 0) + -) a b))
;;; 
;;; => The if statement returns either a - or +, which is then applied
;;; => to the operands.
