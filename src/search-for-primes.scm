(define (runtime)
	(real-time-clock)
	)
(define (timed-prime-test n)
	(newline)
	(display n)
	(start-prime-test n (runtime)))

(define (start-prime-test n start-time)
	; (display "---- start-prime-test ----")
	; (display n)
	(if (prime? n)
		(report-prime (- (runtime) start-time))
		(start-prime-test (+ n 1) start-time) ))

(define (report-prime elapsed-time)
	(display " *** ")
	(display elapsed-time))

(define (smallest-divisor n)
	(find-divisor n 2))

(define (find-divisor n x)
	(cond ((divisable? n x) x)
		((> (* x x) n) n)
		(else (find-divisor n (+ x 1))) ) )

(define (divisable? n x)
	(= (remainder n x) 0))

(define (prime? n)
	(= (smallest-divisor n) n))

(timed-prime-test 1000)
(timed-prime-test 10000)
(timed-prime-test 100000)
(timed-prime-test 1000000)
(timed-prime-test 10000000)
