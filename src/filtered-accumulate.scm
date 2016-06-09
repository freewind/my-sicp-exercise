(define (filtered-accumulate combiner null-value filter term a next b)
	(if (> a b)
		null-value
		(if (filter (term a))
			(combiner (term a) (filtered-accumulate combiner null-value filter term (next a) next b))
			(filtered-accumulate combiner null-value filter term (next a) next b) ) ))

(define (find-divisor n x) 
	(cond ((> (* x x) n) n)
		((= (remainder n x) 0) x)
		(else (find-divisor n (+ x 1)))))

(define (smallest-divisor n)
	(find-divisor n 2))

(define (prime? x)
	(= (smallest-divisor x) x) )

(define (identity x) x)

(define (square x) (* x x))
(define (next x) (+ x 1))

(prime? 2)
(prime? 3)
(prime? 4)
(prime? 5)
(prime? 6)

(filtered-accumulate + 0 prime? identity 2 next 20)

(define (gcd a b)
	(if (= b 0)
		a
		(gcd b (remainder a b))))

(define myN 10)
(define (re-prime? x)
	(= (gcd myN x) 1))

; 1 * 3 * 7 * 9
(filtered-accumulate * 1 re-prime? identity 1 next myN)


