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




;;; Exercise 2.26
;;;
;;; (define x (list 1 2 3))
;;; (define x (list 4 5 6))
;;;
;;; (append x y) => (1 2 3 4 5 6)
;;; (cons x y)   => ((1 2 3) 4 5 6)
;;; (list x y)   => ((1 2 3) (4 5 6))



;;; Exercise 2.27

;;; very elegant solution from sicp solution
(define (deep-reverse alist)
  (cond ((null? alist) '())
        ((not (pair? alist)) alist)
        (else (append (deep-reverse (cdr alist))
                      (list (deep-reverse (car alist)))))))


;;; my version
;;; note: I like the above version a lot better!!!
(define (deep-reverse alist)
  (let ((shallow-reverse-list (reverse alist)))
    (define (iter input answer)
      (cond ((null? input) answer)
            ((pair? (car input)) (iter (cdr input) (append answer (list (reverse (car input))))))
            (else (iter (cdr input) (list answer (car input))))))
    (iter shallow-reverse-list '())))




;;; Exercise 2.28

;;; I think this is an elegant solution I came up with
;;; very happy with it
(define (fringe tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else (append (fringe (car tree))
                      (fringe (cdr tree))))))




;;; Exercise 2.29

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define (mobile? m)
  (and (pair? (left-branch m)) (pair? (right-branch m))))

(define (weight-leaf? m)
  (not (pair? (right-branch m))))

(define (total-weight mobile)
  (cond ((not (pair? mobile)) 0)
        ((weight-leaf? mobile) (branch-structure mobile))
        (else (+ (total-weight (left-branch mobile)) 
                 (total-weight (right-branch mobile))))))

(define (balanced? mobile)
  (cond ((weight-leaf? mobile) (* (branch-length mobile) 
                                  (branch-structure mobile)))
        (else (= (* (branch-length (left-branch mobile)) (balanced? (left-branch mobile)))
                 (* (branch-length (right-branch mobile)) (balanced? (right-branch mobile)))))))
