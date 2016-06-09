(define (accumulate combiner null-value term a next b)
	(if (> a b)
		null-value
		(combiner (term a) (accumulate combiner null-value term (next a) next b)))
	)

(define (accumulate combiner null-value term a next b)
	(define (f-iter a result) 
		(if (> a b)
			result
			(f-iter (next a) (combiner (term a) result))))
	(f-iter a null-value))


(define (sum term a next b)
	(accumulate + 0 term a next b))

(define (product term a next b)
	(accumulate * 1 term a next b))


(define (square x) (* x x))
(define (next x) (+ x 1))

(sum square 1 next 3)
(product square 1 next 3)


