;===================================================================
;A Pythagorean triplet is a set of three natural numbers, a<b<c, for which,
;
;a2 + b2 = c2
;For example, 32 + 42 = 9 + 16 = 25 = 52.
;
;There exists exactly one Pythagorean triplet for which a + b + c = 1000.
;Find the product abc.
;===================================================================

(use srfi-1)

(define (is-pythagorean-riplet? a b c)
  (if (and (> c b) (> b a) (> c a))
      (= (expt c 2) (+ (expt a 2) (expt b 2)))
      #f))

(define (problem-9)
  (for-each 
   (lambda (a)
     (for-each 
      (lambda (b)
        (for-each
         (lambda (c)
           (if (is-pythagorean-riplet? a b c)
               (if (= (+ a b c) 1000) (print "a:" a ", b:" b ",c:" c "\n"))))
         (iota 1000 1)))
      (iota 1000 1)))
   (iota 1000 1)))

;gosh> (time (problem-9))
;;(time (problem-9))
;; real 441.959
;; user 426.039
;; sys   13.962
;a:200, b:375,c:425
;
;#<undef>
;gosh> (* 200 375 425)
;31875000
