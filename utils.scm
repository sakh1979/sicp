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

