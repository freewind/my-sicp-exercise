(define (sum term a next b)
	(if (> a b) 
		0
		(+ (term a) (sum term (next a) next b))))

(define (simpson f a b n)
	(define h (/ (- b a) n))
	(define (next x) (+ x 1))
	(define (term k)
		(define (y k) (f (+ a (* k h))))
		(cond ((or (= k 0) (= k n)) (y k))
			((even? k) (* 2 (y k)))
			(else (* 4 (y k)))))
	(* (/ h 3.0) (sum term 0 next n)))

(define (even? x)
	(= (remainder x 2) 0))

(define (cube x) (* x x x))

(simpson cube 0 1 1000)