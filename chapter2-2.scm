;;; Sagun Khatri

(load "utils")



;;; Exercise 2.17

(define (last-pair alist)
  (define (iter alist current-counter len)
    (cond ((= current-counter (- len 1)) alist)
          (else (iter (cdr alist) (+ current-counter 1) len))))
  (iter alist 0 (length alist)))
