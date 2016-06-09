(define (smallest-divisor n)
	(find-divisor n 2))

(define (find-divisor n x)
	(cond ((divisable? n x) x)
		((> (* x x) n) n)
		(else (find-divisor n (+ x 1))) ) )

(define (divisable? n x)
	(= (remainder n x) 0))

(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)
