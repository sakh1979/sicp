;;; Sagun Khatri
;;; August 28th, 2013
;;; Utilities procedues

(load "utils")



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

  (define (expt-iter n a)
    (cond ((= n 0) a)
          ((even? n) (square (expt-iter (/ n 2) a)))
          (else (* b (expt-iter (- n 1) a)))))

  (expt-iter n 1))




;;; Exercise 1.17
;;; The exponentiation algorithms in this section are based on performing 
;;; exponentiation by means of repeated multiplication. In a similar way, 
;;; one can perform integer multiplication by means of repeated addition. 
;;; The following multiplication procedure (in which it is assumed that 
;;; our language can only add, not multiply) is analogous to the 
;;; expt procedure:
;;;
;;; (define (* a b)
;;;   (if (= b 0) 0
;;;       (+ a (* a (- b 1)))))
;;;
;;; This algorithm takes a number of steps that is linear in b. Now 
;;; suppose we include, together with addition, operations double, 
;;; which doubles an integer, and halve, which divides an (even) integer 
;;; by 2. Using these, design a multiplication procedure analogous to 
;;; fast-expt that uses a logarithmic number of steps.

(define double (lambda (x) (+ x x)))

(define halve (lambda (x) (/ x 2)))


(define (fast-mult a b)
  (cond ((= b 0) 0)
        ((even? b) (double (fast-mult a (halve b))))
        (else (+ a (fast-mult a (- b 1))))))



;;; Exercise 1.18
;;; Using the results of exercise 1.16 and 1.17, devise a procedure
;;; that generates an iterative process for multiplying two integers
;;; in terms of adding, doubling, and halving and uses a logarithmic
;;; number of steps.

(define (mult a b)

  (define (mult-iter n sum)
    (cond ((= n 0) sum)
          ((even? n) (double (mult-iter (halve n) sum)))
          (else (+ a (mult-iter (- n 1) sum)))))

  (mult-iter b 0))



;;; Exercise 1.19
;;; There is a clever algorithm for computing the Fibonacci numbers in a 
;;; logarithmic number of steps. Recall the transformation of the 
;;; state variables a and b in the fib-iter process of section 1.2.2:
;;; a = a + b and b = a. Call this transformation T, and observe that 
;;; applying T over and over again n times, starting with 1 and 0, 
;;; produces the pair Fib(n + 1) and Fib(n). In other words, the Fibonacci 
;;; numbers are produced by applying T^n, the nth power of the 
;;; transformation T, starting with the pair (1,0). Now consider T to be 
;;; the special case of p = 0 and q = 1 in a family of transformations
;;; Tpq, where Tpq transforms the pair(a, b) according to a = bq + aq + ap
;;; and b = bp + aq. Show that if we apply such transformation Tp`q` twice, 
;;; the effect is the same as using a single transformation Tpq for the
;;; same form, and compute p` and q` in terms of p and q. This gives us an
;;; explicit way to square these transformation, and thus we and compute
;;; T^n using successive squaring, as in the fast-expt procedure. Put this
;;; all together to complete the following procedure, which runs in a 
;;; logarithmic nuber of steps.

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q))    ; compute p`
                   (+ (* 2 p q) (square q))     ; compute q`
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))




;;; Exercise 1.21
;;; Use the smallest-divisor procedure to find the smallest divisor of 
;;; each of the following numbers: 199, 1999, 19999.

(define (smallest-divisor n)

  (define (divides? a b)
    (= (remainder b a) 0))

  (define (find-divisor test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor (+ test-divisor 1)))))

  (find-divisor 2))




;;; Exercise 1.22
;;; Most Lisp implementations include a primitive called runtime that 
;;; returns an integer that specifies the amount of time the system 
;;; has been running (measured, for example, in microseconds). The 
;;; following timed-prime-test procedure, when called with an integer n, 
;;; prints n and checks to see if n is prime. If n is prime, the procedure 
;;; prints three asterisks followed by the amount of time used in 
;;; performing the test.
;;;
;;; (define (timed-prime-test n)
;;;   (newline)
;;;   (display n)
;;;   (start-prime-test n (runtime)))
;;;
;;; (define (start-prime-test n start-time)
;;;   (if (prime? n) (report-prime (- (runtime) start-time))))
;;;
;;; (define (report-prime elapsed-time)
;;;   (display " *** ")
;;;   (display elasped-time))
;;;
;;;
;;; Using this procedure, write a procedure search-for-primes that checks 
;;; the primality of consecutive odd integers in a specified range. Use 
;;; your procedure to find the three smallest primes larger than 1000; 
;;; larger than 10,000; larger than 100,000; larger than 1,000,000. 
;;; Note the time needed to test each prime. Since the testing algorithm 
;;; has order of growth of O(sqrt(n)), you should expect that testing for 
;;; primes around 10,000 should take about (sqrt 10) times as long as testing
;;; for pimes around 1000. Do your timing data bear this out? How well do the
;;; data for 100,000 and 1,000,000 support the (sqrt n) prediction? Is your
;;; result compatible with the notion that programs on your machine run in 
;;; time proportional to the number of steps required for the computation?

(define (timed-prime-test n)
  (display n)
  (start-prime-test n (runtime))
  (newline))

(define (start-prime-test n start-time)
  (if (fast-prime? n 5) (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (newline)
  (display " *** ")
  (display elapsed-time))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (search-for-primes value counter)
  (cond ((>= counter 3) (display "DONE!!!") (newline))
        ((prime? value) (timed-prime-test value) 
                        (search-for-primes (+ value 2) (+ counter 1))) 
        (else (search-for-primes (+ value 2) counter))))



;;; Exercise 1.23
;;; The smallest-divisor procedure shown at the start of this section does 
;;; lots of needless testing: After it checks to see if the number is 
;;; divisible by 2 there is no point in checking to see if it is divisible 
;;; by any larger even numbers. This suggests that the values used for 
;;; test-divisor should not be 2, 3, 4, 5, 6, ..., but rather 2, 3, 5, 7, 9, 
;;; .... To implement this change, define a procedure next that returns 3 if 
;;; its input is equal to 2 and otherwise returns its input plus 2. Modify 
;;; the smallest-divisor procedure to use (next test-divisor) instead of 
;;; (+ test-divisor 1). With timed-prime-test incorporating this modified 
;;; version of smallest-divisor, run the test for each of the 12 primes 
;;; found in exercise 1.22. Since this modification halves the number of 
;;; test steps, you should expect it to run about twice as fast. Is 
;;; this expectation confirmed? If not, what is the observed ratio of 
;;; the speeds of the two algorithms, and how do you explain the fact 
;;; that it is different from 2?

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) a))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (next n)
  (cond ((= n 2) 3)
        (else (+ n 2))))
