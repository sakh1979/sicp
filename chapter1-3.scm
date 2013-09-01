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

