;;; Sagun Khatri
;;; August 28th 2013

;;; Support code for SICP and the Scheme course with Gambit-C 4.x.x

;;; Code for SICP (2nd edition)

;;; Gambit-C has error as a primitive

;;; ---------------------------------------------------------------------
;;; random

(define (random n)
  (random-integer n))



;;; ---------------------------------------------------------------------
;;; Some non-standard names that SICP uses

(define true #t)
(define false #f)
(define nil '())



;;; ---------------------------------------------------------------------
;;; runtime

(define (runtime)
  (* 1000000 (cpu-time)))



;;; ---------------------------------------------------------------------
;;; square

(define square (lambda (x) (* x x)))



;;; ---------------------------------------------------------------------
;;; cube

(define cube (lambda (x) (* x x x)))



;;; ---------------------------------------------------------------------
;;; sum-of-square

(define (sum-of-square a b)
  (+ (square a) (square b)))


;;; ---------------------------------------------------------------------
;;; increment integer by one

(define (inc n) (+ n 1))


;;; ---------------------------------------------------------------------
;;; decrement integer by one

(define (dec n) (- n 1))


;;; ---------------------------------------------------------------------
;;; average

(define average (lambda (a b) (/ (+ a b) 2)))


;;; ---------------------------------------------------------------------
;;; Iteratively calculates Fibonacci number of n

(define (fib n)
  (define (iter a b counter)
    (cond ((= counter n) a)
	  (else (iter (+ a b) a (+ counter 1)))))
  (iter 0 1 0))


;;; ---------------------------------------------------------------------
;;; Iterative Factorial

(define (factorial n)
  (cond ((< n 2) 1)
        (else (* n (factorial (- n 1))))))


;;; ---------------------------------------------------------------------
;;; Filter procedure

(define (filter predicate sequences)
  (cond ((null? sequences) nil)
	((predicate (car sequences))
	 (cons (car sequences)
	       (filter predicate (cdr sequences))))
	(else (filter predicate (cdr sequences)))))


;;; ---------------------------------------------------------------------
;;; Accumulate procedure

(define (accumulate operation initial sequences)
  (cond ((null? sequences) initial)
	(else (operation (car sequences)
			 (accumulate operation initial (cdr sequences))))))


;;; ---------------------------------------------------------------------
;;; Enumerate Interval procedure

(define (enumerate-interval low high)
  (cond ((> low high) nil)
	(else (cons low (enumerate-interval (+ low 1) high)))))


;;; --------------------------------------------------------------------
;;; Enumerate Tree

(define (enumerate-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

;;; fold-right

(define (fold-right op initial sequence)
  (cond ((null? sequence) initial)
	(else (op (car sequence)
                  (fold-right op initial (cdr sequence))))))


;;; fold-left

(define (fold-left op initial sequence)
  (define (iter result rest)
    (cond ((null? rest) rest)
          (else (iter (op result (car rest))
                      (cdr rest)))))
  (iter initial sequence))


;;; prime?

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


;;; permutations

(define (permutations s)
  (if (null? s)
      (list nil)
      (flatmap (lambda (x)
                 (map (lambda (p) (cons x p))
                      (permutations (remove x s))))
               s)))

(define (remove item seq)
  (filter (lambda (x) (not (= x item)))
          seq))
