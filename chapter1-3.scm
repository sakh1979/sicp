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
