;(define (fib n)
;  (if (< n 2)
;      n
;      (+ (fib (- n 1)) (fib (- n 2)))))

(define (fib n)
  (define (fib-iter a b count)
    (if (= count 0)
        b
        (fib-iter (+ a b) a (- count 1))))
  (fib-iter 2 1 n))


(define (problem-2)
  (define (loop sum-of-even sum-of-even-last i threshold)
    (let ((f (fib i)))
      (if (< threshold f)
          sum-of-even
          (loop
           (+ sum-of-even (if (= (modulo f 2) 0) f 0))
           sum-of-even
           (+ i 1)
           threshold))))
  (loop 0 0 0 4000000))