;;; Sagun Khatri
;;; August 31 2013

(load "utils")



;;; ---------------------------------------------------------------------
;;; Exercise 1.29

(define (sum term a next b)
  (cond ((> a b) 0)
        (else (+ (term a) (sum term (next a) next b)))))

(define (simpsons-rule f a b n)

  (define h (/ (- b a) n))

  (define (y-sub-k k) (f (+ a (* k h))))

  (define (term k)
    (* (cond ((or (= k 0) (= k n)) 1.0)
             ((even? k) 2.0)
             (else 4.0))
       (y-sub-k k)))

  (* (/ h 3) (sum term 0 inc n)))



;;; ---------------------------------------------------------------------
;;; Exercise 1.30

(define (sum term a next b)

  (define (iter a result)
    (if (> a b) result
        (iter (next a) (+ result (term a)))))
  
  (iter a 0))



;;; ---------------------------------------------------------------------
;;; Exercise 1.31

(define (product term a next b)

  (define (iter a result)
    (cond ((> a b) result)
          (else (iter (next a) (* result (term a))))))

  (iter a 1))


(define (factorial n)

  (define (identity x) x)

  (product identity 1 inc n))


(define (pi-approx x)

  (define (term n)
    (cond ((even? n) (/ (+ n 2) (+ n 1)))
          (else (/ (+ n 1) (+ n 2)))))

  (* (product term 1 inc x) 4.0))



;;; ---------------------------------------------------------------------
;;; Exercise 1.32

(define (f g)
  (g 2))

;;; => We get an error: "Operator is not a PROCEDURE"
;;;    (2 2)



;;; ---------------------------------------------------------------------
;;; Exercise 1.35

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess) 
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define golden-ratio 
  (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))




;;; ---------------------------------------------------------------------
;;; Exercise 1.36

(define (fixed-point-modify f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define (x-to-the-x y)
  (fixed-point-modify (lambda (x) (/ (log y) (log x))) 10.0))




;;; ---------------------------------------------------------------------
;;; Exercise 1.37

;;; Recursive Version
;;;
(define (cont-frac n d k)
  (cond ((= k 0) 0)
        (else (/ (n k) (+ (d k) (cont-frac n d (- k 1)))))))


;;; Iterative Version
;;;
(define (cont-frac-iter n d k)
  (define (iter counter accu)
    (let ((num      (n counter))
          (denum    (d counter)))
      (cond ((= counter k) accu)
            (else (iter (+ counter 1) (/ num (+ denum accu)))))))
  (iter 0 0))
