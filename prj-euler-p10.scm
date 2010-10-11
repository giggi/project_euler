;===================================================================
;The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
;
;Find the sum of all the primes below two million.
;===================================================================

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

(define (problem-10)
  (fold (lambda (x sum) (+ sum (if (is-prime? x) x 0))) 0 (iota 2000000 2)))