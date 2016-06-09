(define (repeated f n)
	(if (= n 1)
		f
		(compose f (repeated f (- n 1)))))

(define (compose f g)
	(lambda (x) (f (g x))))

(define (square n) (* n n))

((repeated square 3) 5)

(define dx 0.0001)

(define (smooth f) 
	(lambda (x) 
		(/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3.0)))

(define (n-smooth f n)
	((repeated smooth n) f))

((n-smooth square 2) 5)
; ((smooth square) 3.0)