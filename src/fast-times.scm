(define (even? n)
	(= (remainder n 2) 0))

(define (double n) (* n 2))
(define (halve n) (/ n 2))

(define (fast-times a b r)
	(cond ((= b 0) r)
		((even? b) (fast-times (double a) (halve b) r))
		(else (fast-times a (- b 1) (+ r a)))))

(define (d-fast-times a b)
	(fast-times a b 0))

(d-fast-times 3 4)