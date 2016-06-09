(define (fixed-point f guess)
	(let ((y (f guess)))
		(if (close-enough? guess y)
			y
			(fixed-point f y)
			)
		))

(define dx 0.0000001)

(define (close-enough? a b)
	(< (abs (- a b)) dx))

(define (average-dump f)
	(lambda (x)
		(/ (+ x (f x)) 2)
		))

(fixed-point (average-dump (lambda (x) (/ 4 x))) 1.0)

(define (d f)
	(lambda (x) 
		(/ (- (f (+ x dx)) (f x)) dx)))

(define (square x) (* x x))
; ((d (lambda (x) (* x x))) 6)

(define (transform f) 
	(lambda (x)
		(- x (/ (f x) ((d f) x)))))

; ((transform square) 101)

(define (newtons-method f guess)
	(fixed-point (transform f) guess))

(define (cubic a b c)
	(lambda (x)
		(+ (* x x x) (* a (* x x)) (* b x) c)))

; (newtons-method (lambda (x) (- (* x x) 10)) 1.0)
(newtons-method (cubic 1 1 -14) 1.0)
(newtons-method (cubic 3 2 1) 1.0)
(newtons-method (cubic 2 5 5) 1.0)