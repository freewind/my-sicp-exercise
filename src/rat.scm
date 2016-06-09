(define (make-rat n d)
	(let ((g (gcd n d)))
		(let ((n1 (/ n g))
			(d1 (/ d g)))
		(if (and (> n1 0) (< d1 0))
			(cons (- 0 n1) (- 0 d1))
			(cons n1 d1)))))

(define (numer x)
	(car x))

(define (denom x)
	(cdr x))

(define (add-rat x y)
	(make-rat (+ (* (numer x) (denom y))
		(* (denom x) (numer y)))
	(* (denom x) (denom y))))

(define (sub-rat x y)
	(make-rat (- (* (numer x) (denom y))
		(* (denom x) (numer y)))
	(* (denom x) (denom y))))

(define (mul-rat x y)
	(make-rat (* (numer x) (numer y))
		(* (denom x) (denom y))))

(define (div-rat x y)
	(make-rat (* (numer x) (denom y))
		(* (denom x) (numer y))))

(define (equal-rat? x y)
	(= (* (numer x) (denom y))
		(* (denom x) (numer y))))

(define (print-rat a)
	(newline)
	(display (numer a))
	(display "/")
	(display (denom a)))

(define (gcd a b)
	(if (= b 0)
		a
		(gcd b (remainder a b))))

(print-rat (mul-rat 
	(make-rat 2 4) 
	(make-rat 3 6)))

(print-rat (make-rat 2 4))
(print-rat (make-rat -2 -5))
(print-rat (make-rat 2 -4))
(print-rat (make-rat -2 4))

(gcd -2 4)