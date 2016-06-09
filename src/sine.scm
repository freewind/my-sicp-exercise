(define (cube x) (* x x x))

(define (p x)
	(- (* 3 x)
		(* 4 (cube x))))

(define (sine x)
	(if (<= (abs x) 0.1)
		x
		(p (sine (/ x 3.0)))))

(sine (/ (* 2 3.14159) 4))