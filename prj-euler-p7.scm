;===============================================================
;By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13,
;we can see that the 6th prime is 13.
;
;What is the 10001st prime number?
;===============================================================


(define (is-prime? n)
  (define (is-prime-loop n counter)
    (let ((ret #t))
      (if (< counter n)
          (if (= (modulo n counter) 0)
              (set! ret #f)
              (set! ret (is-prime-loop n (+ counter 1)))))
      ret))
  (if (< n 2)
      #f
      (is-prime-loop n 2)))

(define (problem-7 n)
  (define (loop i last-prime prime-counter threshold)
    (if (< prime-counter threshold)
        (begin
          (if (is-prime? i)
              (begin
                (set! prime-counter (+ prime-counter 1))
                (set! last-prime    i)))
;          (print "i=" i ", prime-counter=" prime-counter)
;          (print "last-prime=" last-prime)
          (loop (+ i 1) last-prime prime-counter threshold))
        last-prime))
  (loop 1 -1 0 n))

;gosh> (problem-7 10001)
;20001
