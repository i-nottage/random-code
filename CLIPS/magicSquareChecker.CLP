(deffacts magicSquare
	(square 2 7 6 9 5 1 4 3 8)
	(size 3)
)

(defrule printSquare
	(declare (salience 10))
	(square $?s)
=>
	(printout t ?s crlf crlf)
)
(defrule rows
	(square $?A ?n1 ?n2 ?n3 $?B)
	(size ?s)
	(test (eq 0 (mod (length ?A) ?s)))
	;(test (eq (- ?s 1) (length ?B)))
	
=>
	(assert (sum (+ ?n1 ?n2 ?n3)))
)

(defrule columns
	(square $?A ?n1 $?B ?n2 $?C ?n3 $?D)
	(size ?s)
	(test (eq (length ?B) (length ?C)))
	(test (eq (- ?s 1) (length ?B)))
=>
	(assert (sum (+ ?n1 ?n2 ?n3)))
)

(defrule diagonals
	(square ?n1 ? ?n3 ? ?n5 ? ?n7 ? ?n9)
=>
	(assert (sum (+ ?n1 ?n5 ?n9))
		(sum (+ ?n7 ?n5 ?n3)))
)


(defrule isSquare
	(declare (salience -15))
	(sum ?n)
	(not (sum ?m&~?n))
=>
	(printout t "This is a magic square" crlf)
)

(defrule notSquare
	(sum ?n)
	(sum ?m&~?n)
=>
	(printout t "This is not a magic square" crlf)
	(halt)
)