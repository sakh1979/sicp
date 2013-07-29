(define (square x) (* x x))

(define (sum-of-square x y) (+ (square x) (square y)))

(define (f a) (sum-of-square (+ a 1) (* a 2)))

; ---------------------------------------------------------------------------
; Exercise 1.3
(define (largest-two-square-sum x y z)
  (cond ((= x (max x y)) (sum-of-square x (max y z)))
        ((= y (max x y)) (sum-of-square y (max x z)))))

; ---------------------------------------------------------------------------
; Exercise 1.4
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; ---------------------------------------------------------------------------
; Example 1.1.7
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x)
               x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; ---------------------------------------------------------------------------
; Exercise 1.6
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.0001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

