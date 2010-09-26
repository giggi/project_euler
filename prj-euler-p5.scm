;=========================================================================
;2520 is the smallest number that can be divided by each of the numbers
;from 1 to 10 without any remainder.
;
;What is the smallest positive number that is evenly divisible by all
;of the numbers from 1 to 20?
;=========================================================================

(define (problem-5 init-value)
  (define (is-modulo-zero-from-1-to-20? i)
    (define (loop-to-20 i j)
      (if (>= j 20)
          #t
          (if (= (modulo i j) 0)
              (loop-to-20 i (+ j 1))
              #f)))
    (if (<= i 0)
        #f
        (loop-to-20 i 1)))
  (define (loop i)
    (if (is-modulo-zero-from-1-to-20? i)
        i
        (loop (+ i 1))))
  (loop init-value))

;gosh> (problem-5 2520)
;232792560
