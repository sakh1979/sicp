;;; Sagun Khatri

(load "utils")



;;; ------------------------------------------------------------------------
;;; Exercise 2.1

(define (add-rat x y)
  (make-rat (+ (* (get-numer x) (get-denom y))
               (* (get-numer y) (get-denom x)))
            (* (get-denom x) (get-denom y))))

(define (sub-rat x y)
  (make-rat (- (* (get-numer x) (get-denom y))
               (* (get-numer y) (get-denom x)))
            (* (get-denom x) (get-denom y))))

(define (mul-rat x y)
  (make-rat (* (get-numer x) (get-numer y))
            (* (get-denom x) (get-denom y))))

(define (div-rat x y)
  (make-rat (* (get-numer x) (get-denom y))
            (* (get-numer y) (get-denom x))))

(define (equal-rat? x y)
  (= (* (get-numer x) (get-denom y))
     (* (get-numer y) (get-denom x))))

(define (make-rat n d)
  (let ((g (gcd n d)))
    (cond ((or (< n 0) (< d 0)) 
              (cons (make-negative (/ n g)) (abs (/ d g)))) 
          (else (cons (/ n g) (/ d g))))))

(define (get-numer x) 
  (car x))

(define (get-denom x)
  (cdr x))

(define (print-rat x)
  (display (get-numer x))
  (display "/")
  (display (get-denom x))
  (newline))

(define (make-negative x)
  (cond ((< x 0) x)
        (else (* x -1))))




;;; ------------------------------------------------------------------------
;;; Exercise 2.2

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (start-segment x)
  (car x))

(define (end-segment x)
  (cdr x))

(define (make-segment start end)
  (cons start end))

(define (midpoint-segment segment)
  (let ((p1 (start-segment  segment))
        (p2 (end-segment    segment)))
    (make-point (/ (+ (x-point p1) (x-point p2)) 2)
                (/ (+ (y-point p1) (y-point p2)) 2))))

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline))




;;; ------------------------------------------------------------------------
;;; Exercise 2.4

;;; Proof that this works via substitution rule:
;;;
;;; => (car (cons x y))
;;; => (car (lambda (m) (m x y)))
;;; => ((lambda (m) (m x y)) (lambda (p q) p))
;;; => ((lambda (p q) p) x y)
;;; => x

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))




;;; ------------------------------------------------------------------------
;;; Exercise 2.6

(define zero (lambda (f) (lambda (x) x)))

; => Use substitution to evaluate (add-1 zero)
; ; => (add-1 zero)
; ; => (lambda (f) (lambda (x) (f ((zero f) x))))
; ; => (lambda (f) (lambda (x) (f x)))
; ; => Which is the definition of Church Numerals One!
(define one (lambda (f) (lambda (x) (f x))))

; => Using substitution method to evaluate (add-1 one)
; ; => (add-1 one)
; ; => (lambda (f) (lambda (x) (f ((one f) x))))
; ; => (lambda (f) (lambda (x) (f (f x))))
; ; => Which is the definition of Church Numerals Two!
(define two (lambda (f) (lambda (x) (f (f x)))))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define (int->church n)
  (cond ((= n 0) zero)
        (else (add-1 (int->church (- n 1))))))

(define (church->int f)
  ((f (lambda (x) (+ x 1))) 0))

(define (add a b)
  (lambda (f) 
    (lambda (x)
      ((a f) ((b f) x)))))

