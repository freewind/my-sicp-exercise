(define (even? n)
	(= (remainder n 2) 0))

(define (d-fast b n r)
	(cond ((= n 0) r)
		((even? n) (d-fast (* b b) (/ n 2) r))
		(else (d-fast b (- n 1) (* r b)))
		))

(define (fast-expr b n)
	(d-fast b n 1))

(fast-expr 2 1000)