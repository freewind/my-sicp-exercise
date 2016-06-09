(define (first kinds)
	(cond ((= kinds 1) 1)
		((= kinds 2) 5)
		((= kinds 3) 10)
		((= kinds 4) 25)
		((= kinds 5) 50)))

(define (cc amount kinds)
	(cond ((= amount 0) 1)
		((< amount 0) 0)
		((= kinds 0) 0)
		(else (+ (cc (- amount (first kinds)) kinds)
			(cc amount (- kinds 1))))))

(define (count-change amount)
	(cc amount 5))

(count-change 11)