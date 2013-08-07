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


;;; Exercise 1.6
;;; Alyssa P. Hacker doesn't see why if needs to be provided as a special 
;;; form. ``Why can't I just define it as an ordinary procedure in 
;;; terms of cond?'' she asks. Alyssa's friend Eva Lu Ator claims this 
;;; can indeed be done, and she defines a new version of if:
;;;
;;; (define (new-if predicate then-clause else-clause)
;;;   (cond (predicate then-clause)
;;;         (else else-clause)))
;;; 
;;; Eva demonstrates the program for Alyssa:
;;; (new-if (= 2 3) 0 5)
;;; 5
;;;
;;; (new-if (= 1 1) 0 5)
;;; 0
;;;
;;; Delighted, Alyssa uses new-if to rewrite the square-root program:
;;;
;;; (define (sqrt-iter guess x)
;;;   (new-if (good-enough? guess x)
;;;           guess
;;;           (sqrt-iter (imporve guess x)
;;;                      x)))
;;;
;;; What happens when Alyssa attempts to use this to 
;;; compute square roots? Explain.
;;;
;;; => new-if does not use normal order evaluation, it uses applicative 
;;; order evaluation. That is, the interpreter first evaluates the 
;;; operator and operands and then applies the resulting procedure to the 
;;; resulting arguments. As with Excercise 1.5, this results in an 
;;; infinite recursion because the else-clause is always evaluated, 
;;; thus calling the procedure again ad infinitum.



;;; Exercise 1.7
;;; The good-enough? test used in computing square roots will not be 
;;; very effective for finding the square roots of very small numbers. 
;;; Also, in real computers, arithmetic operations are almost always 
;;; performed with limited precision. This makes our test inadequate for 
;;; very large numbers. Explain these statements, with examples showing 
;;; how the test fails for small and large numbers. An alternative 
;;; strategy for implementing good-enough? is to watch how guess changes 
;;; from one iteration to the next and to stop when the change is a very 
;;; small fraction of the guess. Design a square-root procedure that 
;;; uses this kind of end test. Does this work better for small 
;;; and large numbers?
(define (sqrt-iter guess old-guess x)
  (if (good-enough? guess old-guess x)
      guess
      (sqrt-iter (improve guess x) guess
                 x)))
(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess old-guess x)
  (< (abs (- guess old-guess)) (* guess 0.001)))

(define (sqrt x)
  (sqrt-iter 1.0 2.0 x))


