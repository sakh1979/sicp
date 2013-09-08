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
