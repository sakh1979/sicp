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




;;; Exercise 2.21

(define (square-list items)
  (cond ((null? items) nil)
        (else (cons (square (car items)) (square-list (cdr items))))))

(define (square-list items)
  (map square items))



;;; Exercise 2.22

;;; => This produces the answer list in reverse order because
;;; => the list is being constructed by adding the newer item
;;; => in front of the list.
(define (square-list items)
  (define (iter things answer)
    (cond ((null? things) answer)
          (else (iter (cdr things) (cons (square (car things)) answer)))))
  (iter items nil))

;;; => And, this does not work because we are constructing individual
;;; => list on each iteration
(define (square-list items)
  (define (iter things answer)
    (cond ((null? things) answer)
          (else (iter (cdr things) (cons answer (square (car things)))))))
  (iter items nil))



;;; Exercise 2.23

(define (for-each proc items)
  (cond ((null? items) (newline))
        (else (proc (car items)) (for-each proc (cdr items)))))



;;; Exercise 2.24

;;; => Result printed by the interpreter
;;; => (1 (2 (3 4)))

;;; => The corresponding interpretation as a tree:
;;;                       (1 (2 (3 4)))
;;;                             /\
;;;                            /  \
;;;                           1  / \
;;;                             /   \
;;;                            2   / \
;;;                               /   \
;;;                              3     4 
;;;                              



;;; Exercise 2.25
;;;
;;; (1 3 (5 7) 9) => (car (cdr (car (cdr (cdr x)))))
;;;
;;; ((7)) => (car (car x))
;;;
;;; (1 (2 (3 (4 (5 (6 7))))))   => 
;;; (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr x))))))))))))
