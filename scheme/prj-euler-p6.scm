;===============================================================
;The sum of the squares of the first ten natural numbers is,
;
;1^2 + 2^2 + ... + 10^2 = 385
;
;The square of the sum of the first ten natural numbers is,
;
;(1 + 2 + ... + 10)^2 = 55^2 = 3025
;
;Hence the difference between the sum of the squares of the first
;ten natural numbers and the square of the sum is 3025 - 385 = 2640.
;
;Find the difference between the sum of the squares of the first
;one hundred natural numbers and the square of the sum.
;===============================================================

(use srfi-1)

(define (square x) (* x x))

(define (sum-of-square lis)
  (fold (lambda (x s) (+ s (square x))) 0 lis))

(define (square-of-sum lis)
  (square (fold (lambda (x s) (+ s x)) 0 lis)))
  
(define (problem-6)
  (let ((lis (iota 100 1)))
    (- (square-of-sum lis) (sum-of-square lis))))

;gosh> (problem-6)
;25164150
