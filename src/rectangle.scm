(load "segment.scm")

(define (make-rect1 p1 p2 p3)
	(cons (p1 (cons p2 p3))))
(define (p1 rect)
	(car rect))
(define (p2 rect)
	(car (cdr rect)))
(define (p3 rect)
	(cdr (cdr rect)))

(define (distance p1 p2)
	()
	)


(define (width rect) 

	)
(define (height rect) ???)

(define (perimeter rect) 
	(* (+ (width rect) (height rect)) 2))
(define (area rect) 
	(* (width rect) (height rect)))