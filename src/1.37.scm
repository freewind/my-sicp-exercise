(define (cont-frac n d k)
	(define (f i result)
		(if (= 0 i)
			result
			(f (- i 1) (/ (n i) (+ (d i) result)))))
	(display (n 1))
	(f k (/ (n k) (d k)))
	)

(define (c n)
	(/ 1.0 
		(cont-frac 
			(lambda (i) 1.0)
			(lambda (i) 1.0)
			n))
	)

; (c 1)
; (c 2)
; (c 3)
; (c 4)
; (c 5)
; (c 6)
; (c 7)
; (c 8)
; (c 9)
; (c 10)
; (c 11)
; (c 12)
; (c 13)
; (c 14)

(define (e n)
	(+ (cont-frac 
		(lambda (i) 1.0)
		(lambda (i) 
			(show "--------")
			(show i)
			(show (if (= (remainder i 3) 2)
				(* (+ 1 (floor (/ i 3))) 2)
				1
				))
			)
		n
		)
	2)
	)

(define (show x)
	(newline)
	(display x)
	x
	)

; (e 10)

(define (tan-cf x k)
	(cont-frac 
		(lambda (i) 
			(if (= i 1)
				x
				(- 0.0 (* x x))))
		(lambda (i) 
			(show (- (* i 2) 1)))
		k))

(trace cont-frac)
(trace tan-cf)
(tan-cf 1 3)
(tan-cf 1 10)