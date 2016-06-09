(define (variable? x) (symbol? x))
(define (same-variable? x y) 
	(and (variable? x) (variable? y) (eq? x y)))

(define (sum? exp) (eq? (car exp) '+))
(define (first-sum exp) (car (cdr exp)))
(define (second-sum exp) (car (cdr (cdr exp))))
(define (make-sum a b) (list '+ a b))

(define (product? exp) (eq? (car exp) '*))
(define (first-product exp) (car (cdr exp)))
(define (second-product exp) (car (cdr (cdr exp))))
(define (make-product a b) (list '* a b))

(define (exponentiation? exp) (eq? (car exp) '**))
(define (base exp) (car (cdr exp)))
(define (exponent exp) (car (cdr (cdr exp))))
(define (make-exponentiation a b) (list '** a b))

(define (deriv exp var)
	(cond ((number? exp) 0)
		((variable? exp) (if (same-variable? exp var) 1 0))
		((sum? exp) 
			(make-sum 
				(deriv (first-sum exp) var) 
				(deriv (second-sum exp) var))
			)
		((product? exp) 
			(let ((p1 (first-product exp))
				(p2 (second-product exp)))
			(make-sum
				(make-product p1 (deriv p2 var))
				(make-product p2 (deriv p1 var)))
			))
		((exponentiation? exp)
			(let ((u (base exp))
				(n (exponent exp)))
				(make-product 
					(make-product 
						(exponent exp)
						(make-exponentiation u (list '- n 1))
						)
					(deriv u var)
					)
				)
			)
		(else (error "Unknown exp type: " exp))
		)
	)
