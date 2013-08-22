;;; Exercise 1.9
;;; Each of the following two procedures defines a method for adding two
;;; positive integers in terms of the procedures inc, which increments
;;; its argument by 1, and dec, which decrements its argument by 1.
;;;
;;; (define (+ a b)
;;;   (if (= a 0)
;;;       b
;;;       (inc (+ (dec a) b))))
;;;
;;; (define (+ a b)
;;;   (if (= a 0)
;;;       b
;;;       (+ (dec a) (inc b))))
;;;
;;; Using the substitution model, illustrate the process generated
;;; by each procedure in evaluating (+ 4 5). Are these processes
;;; iterative or recursive?
;;;
;;; Using the substitution model, illustrate the process generated
;;; by each procedure in evaluating (+ 4 5). Are these processes
;;; iterative or recursive?
;;;
;;; => This is using the first procedure
;;; => Recursive Process!!!
;;; => (+ 4 5)
;;;    (inc (+ 3 5))
;;;    (inc (inc (+ 2 5)))
;;;    (inc (inc (inc (+ 1 5))))
;;;    (inc (inc (inc (inc (+ 0 5)))))
;;;    (inc (inc (inc (inc 5))))
;;;    (inc (inc (inc 6)))
;;;    (inc (inc 7))
;;;    (inc 8)
;;;    9
;;;
;;; => This is using the second procedure
;;; => Iterative Process!!!
;;; => (+ 4 5)
;;;    (+ 3 6)
;;;    (+ 2 7)
;;;    (+ 1 8)
;;;    (+ 0 9)
;;;    9
;;;



;;; Exercise 1.10
;;; The following procedure computes a mathematical function called 
;;; Ackermann's function.
;;;
;;; (define (A x y)
;;;   (cond ((= y 0) 0)
;;;         ((= x 0) (* 2 y))
;;;         ((= y 1) 2)
;;;         (else (A (- x 1)
;;;                  (A x (- y 1))))))
;;;
;;; => 
;;; => (A 1 10)
;;;    (A 0 (A 1 9)))
;;;    (A 0 (A 0 (A 1 8))))
;;;    (A 0 (A 0 (A 0 (A 1 7)))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 1 6))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 5)))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 4))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 3)))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 2))))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1)))))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2)))))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 4)))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 8))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 16)))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 32))))))
;;;    (A 0 (A 0 (A 0 (A 0 64)))))
;;;    (A 0 (A 0 (A 0 128))))
;;;    (A 0 (A 0 256)))
;;;    (A 0 512))
;;;    1024
;;;
;;;
;;; => (A 2 4)
;;;    (A 1 (A 2 3))
;;;    (A 1 (A 1 (A 2 2)))
;;;    (A 1 (A 1 (A 1 (A 2 1))))
;;;    (A 1 (A 1 (A 1 2)))
;;;    (A 1 (A 1 (A 0 (A 1 1))))
;;;    (A 1 (A 1 (A 0 2)))
;;;    (A 1 (A 1 4))
;;;    (A 1 (A 0 (A 1 3)))
;;;    (A 1 (A 0 (A 0 (A 1 2))))
;;;    (A 1 (A 0 (A 0 (A 0 (A 1 1)))))
;;;    (A 1 (A 0 (A 0 (A 0 2))))
;;;    (A 1 (A 0 (A 0 4)))
;;;    (A 1 (A 0 8))
;;;    (A 1 16)
;;;    (A 0 (A 1 15))
;;;    (A 0 (A 0 (A 1 14)))
;;;    (A 0 (A 0 (A 0 (A 1 13))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 1 12)))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 11))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 10)))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 9))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 8)))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 7))))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 6)))))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 5))))))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 4)))))))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 3))))))))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 2)))))))))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1))))))))))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2)))))))))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 4))))))))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 8)))))))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 16))))))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 32)))))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 64))))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 128)))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 256))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 512)))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 1024))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 2048)))))
;;;    (A 0 (A 0 (A 0 (A 0 4096))))
;;;    (A 0 (A 0 (A 0 8192)))
;;;    (A 0 (A 0 16384))
;;;    (A 0 32768)
;;;    65536
;;;
;;;
;;; => 
;;; => (A 3 3)
;;;    (A 2 (A 3 2))
;;;    (A 2 (A 2 (A 3 1)))
;;;    (A 2 (A 2 2))
;;;    (A 2 (A 1 (A 2 1)))
;;;    (A 2 (A 1 2))
;;;    (A 2 (A 0 (A 1 1)))
;;;    (A 2 (A 0 2))
;;;    (A 2 4)
;;;    (A 1 (A 2 3))
;;;    (A 1 (A 1 (A 2 2)))
;;;    (A 1 (A 1 (A 1 (A 2 1))))
;;;    (A 1 (A 1 (A 1 2)))
;;;    (A 1 (A 1 (A 0 (A 1 1))))
;;;    (A 1 (A 1 (A 0 2)))
;;;    (A 1 (A 1 4))
;;;    (A 1 (A 0 (A 1 3)))
;;;    (A 1 (A 0 (A 0 (A 1 2))))
;;;    (A 1 (A 0 (A 0 (A 0 (A 1 1)))))
;;;    (A 1 (A 0 (A 0 (A 0 2))))
;;;    (A 1 (A 0 (A 0 4)))
;;;    (A 1 (A 0 8))
;;;    (A 1 16)
;;;    (A 0 (A 1 15))
;;;    (A 0 (A 0 (A 1 14)))
;;;    (A 0 (A 0 (A 0 (A 1 13))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 1 12)))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 11))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 10)))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 9))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 8)))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 7))))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 6)))))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 5))))))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 4)))))))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 3))))))))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 2)))))))))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1))))))))))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2)))))))))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 4))))))))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 8)))))))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 16))))))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 32)))))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 64))))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 128)))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 256))))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 512)))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 1024))))))
;;;    (A 0 (A 0 (A 0 (A 0 (A 0 2048)))))
;;;    (A 0 (A 0 (A 0 (A 0 4096))))
;;;    (A 0 (A 0 (A 0 8192)))
;;;    (A 0 (A 0 16384))
;;;    (A 0 32768)
;;;    65536
;;;
;;; Consider the following procedures, where A is the procedure defined above:
;;;
;;; => (define (f n) (A 0 n)) => 2 * n
;;; 
;;; => (define (g n) (A 1 n)) => 2^n
;;;
;;; => (define (h n) (A 2 n)) => 2^2^...(n times)
;;;
;;;



;;; Exercise 1.11
;;; A function f is defined by the rule that f(n) = n if n < 3 and
;;; f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n >= 3. Write a procedure
;;; that computes f by means of recursive process. Write a procedure that
;;; computes f by means of an iterative process.

;;;
;;; recursive version
(define (f n)
  (cond ((< n 3) n)
        (else (+ (f(- n 1)) 
                 (* 2 (f(- n 2))) 
                 (* 3 (f(- n 3)))))))

;;;
;;; iterative version
(define (f n)
  (f-iter 2 1 0 2 n))

(define (f-iter a b c count n)
  (cond ((< n 3) n)
        ((= count n) a)
        (else (f-iter (+ a (* 2 b) (* 3 c))
                      a
                      b
                      (+ count 1)
                      n))))



;;; Exercise 1.12
;;; The following pattern of numbers is called Pascal's triangle.
;;;
;;;            1
;;;           1 1
;;;          1 2 1
;;;         1 3 3 1
;;;        1 4 6 4 1
;;; 
;;; The numbers at the edge of the triangle are all 1, and each number 
;;; inside the triangle is the sum of the two numbers above it.
;;; Write a procedure that computes elements of Pascal's triangle by 
;;; means of a recursive process.

(define (pascal c r)
  (cond ((or (= c 0) (= c r)) 1)
        (else (+ (pascal(- c 1) (- r 1)) (pascal c (- r 1))))))




;;; Exercise 1.16
;;; Design a procedure that evolves an iterative exponentiation process 
;;; that uses successive squaring and uses a logarithmic number of steps, 
;;; as does fast-expt. (Hint: Using the observation that (b^(n/2))^2 = 
;;; (b^2)^(n/2), keep, along with the exponent n and the base b, an 
;;; additional state variable a, and define the state transformation in 
;;; such a way that the product (a * b^n)  is unchanged from state to 
;;; state. At the beginning of the process a is taken to be 1, and the 
;;; answer is given by the value of a at the end of the process. In 
;;; general, the technique of defining an invariant quantity that remains 
;;; unchanged from state to state is a powerful way to think about the 
;;; design of iterative algorithms.)

(define (fast-expt b n)

  (define square (lambda (x) (* x x)))

  (define (expt-iter n a)
    (cond ((= n 0) a)
          ((even? n) (square (expt-iter (/ n 2) a)))
          (else (* b (expt-iter (- n 1) a)))))

  (expt-iter n 1))
