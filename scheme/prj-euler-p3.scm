;================================================================
;The prime factors of 13195 are 5, 7, 13 and 29.
;
;What is the largest prime factor of the number 600851475143 ?
;================================================================

(define (problem-3 n)
  (define (loop div n)
    (if (= div n)
        div
        (if (not (= (modulo n div) 0))
            (loop (+ div 1) n)
            (loop div (/ n div)))))
  (loop 2 n))

;gosh> (problem-3 600851475143)
;6857
