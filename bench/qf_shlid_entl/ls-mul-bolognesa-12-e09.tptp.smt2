(set-logic QF_SHLS)

(set-info :source |
Quang Loc Le lequangloc@gmail.com
|)
(set-info :smt-lib-version 2.0)
(set-info :category "crafted") 
(set-info :status unsat)
(set-info :version "2019-01-18")

; Sorts for locations, one by cell sort
(declare-sort RefSll_t 0)

; Types of cells in the heap

(declare-datatypes (
	(Sll_t 0)
	) (
	((c_Sll_t (next RefSll_t) ))
	)
)

; Type of heap

(declare-heap (RefSll_t Sll_t) 
)

(define-fun-rec ls ((in RefSll_t)(out RefSll_t)) Bool
	(or 
		(and 
			(= in out)
			(_ emp RefSll_t Sll_t)
		)

		(exists ((u RefSll_t))
	 
		(and 
			(distinct in out)
		(sep 
			(pto in (c_Sll_t u ))
			(ls u out )
		)

		)

		)

	)
)

(define-fun-rec ls1 ((in RefSll_t)(out RefSll_t)) Bool
	(or 
		(and 
			(= in out)
			(_ emp RefSll_t Sll_t)
		)

		(exists ((u RefSll_t))
	 
		(and 
			(distinct in out)
		(sep 
			(pto in (c_Sll_t u ))
			(ls1 u out )
		)

		)

		)

	)
)


(check-sat) 
;; variables
(declare-const x0 RefSll_t)
(declare-const x1 RefSll_t)
(declare-const x2 RefSll_t)
(declare-const x3 RefSll_t)
(declare-const x4 RefSll_t)
(declare-const x5 RefSll_t)
(declare-const x6 RefSll_t)
(declare-const x7 RefSll_t)
(declare-const x8 RefSll_t)
(declare-const x9 RefSll_t)
(declare-const x10 RefSll_t)
(declare-const x11 RefSll_t)
(declare-const x12 RefSll_t)
(declare-const x13 RefSll_t)
(declare-const x14 RefSll_t)
(declare-const x15 RefSll_t)

(assert 
		(and 
			(= (as nil RefSll_t) (as nil RefSll_t))
		(sep 
			(ls x8 x12 )
			(pto x12 (c_Sll_t x2 ))
			(ls1 x11 x9 )
			(ls x6 x10 )
			(pto x2 (c_Sll_t x6 ))
			(ls1 x5 x9 )
			(pto x3 (c_Sll_t x4 ))
			(ls x4 x8 )
			(pto x1 (c_Sll_t x6 ))
			(pto x10 (c_Sll_t x1 ))
			(pto x9 (c_Sll_t x7 ))
			(ls1 x7 x4 )
		)

		)

)

(assert (not 
		(sep 
			(ls x11 x9 )
			(ls x1 x6 )
			(ls x3 x4 )
			(ls x5 x8 )
			(ls x8 x1 )
		)

))

(check-sat)
