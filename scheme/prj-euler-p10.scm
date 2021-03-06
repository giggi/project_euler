;===================================================================
;The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
;
;Find the sum of all the primes below two million.
;===================================================================

(use srfi-1)

(define (is-prime? n)
  (define (is-prime-loop n counter)
    (let ((ret #t) (sqrt-n (sqrt n)))
      (if (<= counter sqrt-n)
          (if (= (modulo n counter) 0)
              (set! ret #f)
              (set! ret (is-prime-loop n (+ counter 2)))))
      ret))
  (cond [(< n 2) #f]
        [(= n 2) #t]
        [(= (modulo n 2) 0) #f]
        [else (is-prime-loop n 3)]))

(define (problem-10)
  (fold (lambda (x sum) (+ sum (if (is-prime? x) x 0))) 0 (iota 2000000 2)))

(problem-10)

;; By Thinkpad X200 (C2D 2.4GHz, 2GB)
;gosh> (time (problem-10))
;;(time (problem-10))
;; real  34.340
;; user  33.930
;; sys    0.327
;142913828922

;; By MBP15 (i5 2.4GHz, 4GB)
;bash-3.2$ time gosh prj-euler-p10.scm
;
;real    0m23.601s
;user    0m23.510s
;sys     0m0.074s
