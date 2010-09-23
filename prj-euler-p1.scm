; ========================================================================
;If we list all the natural numbers below 10 that are multiples of 3 or 5,
;we get 3, 5, 6 and 9. The sum of these multiples is 23.
;
;Find the sum of all the multiples of 3 or 5 below 1000.
; ========================================================================


(define (problem-1 n)
  (define (select i)
    (if (or (= (modulo i 3) 0)
            (= (modulo i 5) 0))
        i
        0))
  (define (loop sum i n)
    (if (<= n i)
        sum
        (loop (+ sum (select i)) (+ i 1) n)))
  (loop 0 0 n))

(problem-1 1000)
;233168
