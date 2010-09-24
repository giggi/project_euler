;=======================================================================
;A palindromic number reads the same both ways. The largest palindrome
;made from the product of two 2-digit numbers is 9009 = 91  99.
;
;Find the largest palindrome made from the product of two 3-digit numbers.
;=======================================================================

(define (problem-4)
  (let ((max-palindromic-number 0))
    (define (palindromic-number? n)
      (define reverse-n
        (string->number
         (list->string
          (reverse
           (string->list (number->string n))))))
      (= n reverse-n))
    (define (loop func i threshold)
      (if (<= i threshold)
          #t
          (begin 
            (func i)
            (loop func (- i 1) threshold))))
    (define (inner-loop n)
      (let ((j n))
        (define (test i)
          (if (palindromic-number? (* i j))
              (begin 
                ;(print i)
                ;(print j)
                ;(print (* i j))
                (if (> (* i j) max-palindromic-number)
                    (set! max-palindromic-number (* i j))))))
        (loop test 999 100)))
    (loop inner-loop 999 100)
    (print max-palindromic-number)))

;gosh> (problem-4)
;906609
;#<undef>

