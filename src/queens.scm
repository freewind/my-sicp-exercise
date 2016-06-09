(define empty-borad '())

(define (s x)
	(display "=========")
	(display x)
	(newline)
	x)

(define (queens n)
	(define (queen-cols k)
		(if (= k 0)
			(list empty-borad)
			(filter 
				(lambda (positions) (safe? positions))
				(flatmap 
					(lambda (rest)
						(map (lambda (new-row) 
							(adjoin-position new-row rest))
						(s (range 1 n))))
					(queen-cols (- k 1))))))
	(queen-cols n))

(define (safe? positions)
	(define (f p diff rest)
		(cond ((null? rest) true)
			((or (= (- p diff) (car rest)) 
				(= p (car rest)) 
				(= (+ p diff) (car rest)))
			false)
			(else (f p (+ diff 1) (cdr rest)))))
	(f (car positions) 1 (cdr positions)))

(define (adjoin-position new-row rest)
	(cons new-row rest))

(define (range start end)
	(if (> start end)
		'()
		(cons start (range (+ start 1) end))))

(define (flatmap op ls)
	(flatten (map op ls)))

(define (flatten ls)
	(if (null? ls)
		'()
		(append (car ls) (flatten (cdr ls)))))

(length (queens 8))

