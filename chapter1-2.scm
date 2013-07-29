; ---------------------------------------------------------------------------
; Recurive Process Factorial
(define (factorial n)
  (if (= n 1) 1
    (* n (factorial (- n 1)))))

; ---------------------------------------------------------------------------
; Iterative Process Factorial
; 
; The implementation of Scheme we shall consider in chapter 5 does not 
; share this defect. It will execute an iterative process in constant 
; space, even if the iterative process is described by a recursive 
; procedure. An implementation with this property is called tail-recursive. 
; With a tail-recursive implementation, iteration can be expressed using 
; the ordinary procedure call mechanism, so that special iteration 
; constructs are useful only as syntactic sugar.
(define (factorial n)
  (fact-iter 1 1 n))

(define (fact-iter product counter max-count)
  (if (> counter max-count) product
    (fact-iter (* counter product)
               (+ counter 1)
               max-count)))

