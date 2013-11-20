(deffacts denominations
	(bills 100 50 20 10 5 1)
	(coins 25 10 5 1)
	(b-change)
	(c-change)
)

(defrule getAmount
=>
	(bind ?amt (* 100 (read-number)))
	(assert (dAmount (div ?amt 100))
		(cAmount (integer (mod ?amt 100)))
	)
)

(defrule denominate-bills
	?h<-(bills ?a $?B)
	(dAmount ?d)
	(b-change $?S)
=>
	(retract ?h)
	(bind ?n (div ?d ?a))
	(assert (b-change(create$ $?S ?n))
		(bills ?B)
		(dAmount (- ?d (* ?n ?a) ) ) )
)

(defrule denominate-coins
	?h<-(coins ?a $?B)
	(cAmount ?c)
	(c-change $?S)
=>
	(retract ?h)
	(bind ?n (div ?c ?a))
	(assert (c-change(create$ $?S ?n))
		(coins ?B)
		(cAmount (- ?c (* ?n ?a) ) ) )
)

(defrule printDenoms
	(b-change ?b1 ?b2 ?b3 ?b4 ?b5 ?b6)
	(c-change ?c1 ?c2 ?c3 ?c4)
=>
	(printout t 	crlf "Bills:" crlf
			?b1 " 100's," crlf
			?b2 " 50's," crlf
			?b3 " 20's," crlf
			?b4 " 10's," crlf
			?b5 " 5's," crlf
			?b6 " 1's," crlf crlf
			)

	(printout t 	"Coins:" crlf
			?c1 " 25's," crlf
			?c2 " 10's," crlf
			?c3 " 5's," crlf
			?c4 " 1's," crlf
			)
)