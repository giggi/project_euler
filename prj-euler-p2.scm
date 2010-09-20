(define (fib n)
  (if (<= n 2)
      n
      (+ (fib (- n 1)) (fib (- n 2)))))

(define (problem-2 n)
  (define (loop sum i n)
    (if (<= n i)
        sum
        (loop (+ sum (fib i)) (+ i 1) n)))
  (loop 0 0 n))
