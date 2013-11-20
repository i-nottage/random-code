(deffacts randList
	(list)
	(size 0))
(defrule createList
	?f<-(list)
	?g<-(size 0)
=>
	(retract ?f ?g)
	(assert (list (random 1 10))
		(size 1))
)

(defrule randomInts

	?f<-(list $?A ?a)
	?g<-(size ?n)
	(test (< ?n 10))
=>
	(retract ?f)
	(retract ?g)
	(assert (list ?A ?a (+ ?a (random 0 10)))
	        (size (+ ?n 1)))
)

(defrule ss
	(size 10)
	(list $?A)

=>
	(printout t "Your List: " ?A crlf)
	(printout t "Enter a target:" crlf)
	(bind ?n (read-number))
	(assert (target ?n))
)

(defrule search
	(target ?n)
	(list $?A)
=>
	(bind ?i (member$ ?n $?A))
	(assert (targStatus ?i))
)


(defrule found
	(targStatus ?i&~FALSE)
=>
	(printout t "found at " ?i crlf)
)

(defrule notfound
	(targStatus FALSE)
=>
	(printout t "not found" crlf)
)