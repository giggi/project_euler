;===================================================================
;Find the greatest product of five consecutive digits in the 1000-digit number.
;
;73167176531330624919225119674426574742355349194934
;96983520312774506326239578318016984801869478851843
;85861560789112949495459501737958331952853208805511
;12540698747158523863050715693290963295227443043557
;66896648950445244523161731856403098711121722383113
;62229893423380308135336276614282806444486645238749
;30358907296290491560440772390713810515859307960866
;70172427121883998797908792274921901699720888093776
;65727333001053367881220235421809751254540594752243
;52584907711670556013604839586446706324415722155397
;53697817977846174064955149290862569321978468622482
;83972241375657056057490261407972968652414535100474
;82166370484403199890008895243450658541227588666881
;16427171479924442928230863465674813919123162824586
;17866458359124566529476545682848912883142607690042
;24219022671055626321111109370544217506941658960408
;07198403850962455444362981230987879927244284909188
;84580156166097919133875499200524063689912560717606
;05886116467109405077541002256983155200055935729725
;71636269561882670428252483600823257530420752963450
;===================================================================

(define (read-list-from-file filename)
  (define (process)
    (let ((c (read-char)))
      (cond [(not (eof-object? c))
             ;(format #t "~A~%" c)
             (cons c (process))]
            [else
             '()])))
  (define (main filename)
    (with-input-from-file filename process))
  (main filename))


(define (problem-8 filename)
  (let ((lis (read-list-from-file filename))
        (max-product-value 0)
        (ascii->integer (lambda (a) (- (char->integer a) 48)))
        (max (lambda (a b) (if (> a b) a b)))
        (max-element (lambda (lis)
                       (fold (lambda (x max) (if (> x max) x max)) -1 lis))))
    (define (generate-integral lis)
      (let ((counter 1)
            (product 1))
        (map (lambda (x)
               (let ((xi (ascii->integer x)))
                 ;(print "x: " x ", base: " base "[counter:" counter "]\n")
                 (cond [(> counter 5)
                        (set! counter 1) (set! product 1) xi]
                       [else
                        (inc! counter)
                        (set! product (* xi product)) product])))
             lis)))
    (define (loop lis counter)
      (let ((product-value (max-element (generate-integral lis))))
        (set! max-product-value (max product-value max-product-value))
        (cond [(>= counter 5) #t]
              [else (loop (cdr lis) (+ counter 1))])))
    (loop lis 1)
    max-product-value))

;gosh> (problem-8 "prj-euler-p8-input.txt")
;40824
