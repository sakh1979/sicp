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
