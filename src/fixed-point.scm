(define (fixed-point f a)
	(let ((next (show (f a))))
		(if (close-enough? a next)
			next
			(fixed-point f next))))

(define (show a)
	(newline)
	(display a)
	a)

(define tolorance 0.0000001)
(define (close-enough? a b)
	(< (abs (- a b)) tolorance))

(fixed-point cos 1)
(fixed-point (lambda (x) (+ 1 (/ 1.0 x))) 1)

(fixed-point 
	(lambda (x) (/ (log 1000) (log x))) 
	10)
(fixed-point 
	(lambda (x) (/ (+ x (/ (log 1000) (log x))) 2)) 
	10)