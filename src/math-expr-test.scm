(load "test-framework.scm")
(load "math-expr.scm")

(test-with-cases deriv
	(list
		(list (list 'x 'x) '1)
		(list (list '(+ x 3) 'x) '(+ 1 0))
		(list (list '(* x y) 'x) '(+ (* x 0) (* y 1)))
		(list (list '(* (* x y) (+ x 3)) 'x) ' (+ (* (* x y) (+ 1 0)) (* (+ x 3) (+ (* x 0) (* y 1)))))
		(list (list '(** x n) 'x) '(* (* n (** x (- n 1))) 1))
		; (list (list '(* x y (+ x 3)) 'x) '())
		))