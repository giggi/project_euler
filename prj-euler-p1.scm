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
