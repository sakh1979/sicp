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


;;; Exercise 1.5
;;; Ben Bitdiddle has invented a test to determine whether the interpreter 
;;; he is faced with is using applicative-order evaluation or normal-order 
;;; evaluation. He defines the following two procedures:
;;; (define (p) (p))
;;; 
;;; (define (test x y)
;;;   (if (= x 0)
;;;       0
;;;       y))
;;;
;;; Then he evaluates the expression: 
;;;
;;; (test 0 (p))
;;;
;;; What behavior will Ben observe with an interpreter that uses 
;;; applicative-order evaluation? What behavior will he observe with an 
;;; interpreter that uses normal-order evaluation? Explain your answer. 
;;; (Assume that the evaluation rule for the special form if is the same 
;;; whether the interpreter is using normal or applicative order: The 
;;; predicate expression is evaluated first, and the result determines 
;;; whether to evaluate the consequent or the alternative expression.)
;;;
;;; =>  The alternative ``fully expand and then reduce'' evalutation method
;;;     is known as ``normal-oder evaluation'', in contrast to the ``evaluate
;;;     the arguments and then apply'' method that the interpreter acutally
;;;     uses, which is called ``applicative order evaluation''.
;;;
;;;     Both the ``applicative-oder evaluation'' and 
;;;     ``normal-order evaluation'' interpreter will go into a infinite 
;;;     loop. Because, no matter what, (define (p) (p)) will never
;;;     evaluate to anything.
