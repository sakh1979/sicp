;;; Sagun Khatri

(load "utils")



;;; Exercise 2.17

(define (last-pair alist)
  (define (iter alist current-counter len)
    (cond ((= current-counter (- len 1)) alist)
          (else (iter (cdr alist) (+ current-counter 1) len))))
  (iter alist 0 (length alist)))



;;; Exercise 2.18

(define (reverse alist)
  (define (helper input output)
    (cond ((null? input) output)
          (else (helper (cdr input) (cons (car input) output)))))
  (helper alist (list )))



;;; Exercise 2.19

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
          (+ (cc amount
                 (except-first-denomination coin-values))
             (cc (- amount
                    (first-denomination coin-values))
                 coin-values)))))

(define (no-more? alist)
  (null? alist))

(define (except-first-denomination alist)
  (cdr alist))

(define (first-denomination alist)
  (car alist))



;;; Exercise 2.20

(define (same-parity x . y)
  (let ((parity (remainder x 2)))
    (define (helper input output)
      (cond ((null? input) output)
            ((= (remainder (car input) 2) parity)
             (helper (cdr input) (append output (list (car input)))))
            (else (helper (cdr input) output))))
    (helper y (list x))))
