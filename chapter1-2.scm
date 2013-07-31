; ---------------------------------------------------------------------------
; Recurive Process Factorial
(define (factorial n)
  (if (= n 1) 1
    (* n (factorial (- n 1)))))

; ---------------------------------------------------------------------------
; Iterative Process Factorial
; 
; The implementation of Scheme we shall consider in chapter 5 does not 
; share this defect. It will execute an iterative process in constant 
; space, even if the iterative process is described by a recursive 
; procedure. An implementation with this property is called tail-recursive. 
; With a tail-recursive implementation, iteration can be expressed using 
; the ordinary procedure call mechanism, so that special iteration 
; constructs are useful only as syntactic sugar.
(define (factorial n)
  (fact-iter 1 1 n))

(define (fact-iter product counter max-count)
  (if (> counter max-count) product
    (fact-iter (* counter product)
               (+ counter 1)
               max-count)))

; ---------------------------------------------------------------------------
; Example 1.2.2
;
(define (fib n)
  (fib-iter 1 0 n))

(define (fib-iter a b count)
  (if (= count 0) b
      (fib-iter (+ a b) a (- count 1))))

; ---------------------------------------------------------------------------
; How many different ways can we make change of $ 1.00, 
; given half-dollars, quarters, dimes, nickels, and pennies? 
; More generally, can we write a procedure to compute the number of 
; ways to change any given amount of money?
(define (count-change amount) 
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount (- kinds-of-coins 1)) 
                 (cc (- amount (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

; ---------------------------------------------------------------------------
; Example 1.2.6: Testing for Primality (Searching for divisors)
(define (smallest-divisor n)
  (find-divisor n 2))

(define (square n) (* n n))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

