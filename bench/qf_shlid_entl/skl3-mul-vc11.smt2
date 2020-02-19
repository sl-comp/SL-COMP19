(set-logic QF_SHLID)

(set-info :source |
Quang Loc Le lequangloc@gmail.com
|)
(set-info :smt-lib-version 2.0)
(set-info :category "crafted")
(set-info :status sat)
(set-info :version "2018-06-15")


; Sorts for locations, one by cell sort
(declare-sort RefSL3_t 0)

; Types of cells in the heap

(declare-datatypes (
	(SL3_t 0)
	) (
	((c_SL3_t (n1 RefSL3_t) (n2 RefSL3_t) (n3 RefSL3_t) ))
	)
)

; Type of heap

(declare-heap (RefSL3_t SL3_t) 
)

(define-fun-rec skl1 ((hd RefSL3_t)(ex RefSL3_t)) Bool
	(or 
		(and 
			(= hd ex)
			(_ emp RefSL3_t SL3_t)
		)

		(exists ((tl RefSL3_t))
	 
		(and 
			(distinct hd ex)
		(sep 
			(pto hd (c_SL3_t tl (as nil RefSL3_t) (as nil RefSL3_t) ))
			(skl1 tl ex )
		)

		)

		)

	)
)

(define-fun-rec skl11 ((hd RefSL3_t)(ex RefSL3_t)) Bool
	(or 
		(and 
			(= hd ex)
			(_ emp RefSL3_t SL3_t)
		)

		(exists ((tl RefSL3_t))
	 
		(and 
			(distinct hd ex)
		(sep 
			(pto hd (c_SL3_t tl (as nil RefSL3_t) (as nil RefSL3_t) ))
			(skl11 tl ex )
		)

		)

		)

	)
)

(define-fun-rec skl2 ((hd RefSL3_t)(ex RefSL3_t)) Bool
	(or 
		(and 
			(= hd ex)
			(_ emp RefSL3_t SL3_t)
		)

		(exists ((tl RefSL3_t)(Z1 RefSL3_t))
	 
		(and 
			(distinct hd ex)
		(sep 
			(pto hd (c_SL3_t Z1 tl (as nil RefSL3_t) ))
			(skl1 Z1 tl )
			(skl2 tl ex )
		)

		)

		)

	)
)

(define-fun-rec skl21 ((hd RefSL3_t)(ex RefSL3_t)) Bool
	(or 
		(and 
			(= hd ex)
			(_ emp RefSL3_t SL3_t)
		)

		(exists ((tl RefSL3_t)(Z1 RefSL3_t))
	 
		(and 
			(distinct hd ex)
		(sep 
			(pto hd (c_SL3_t Z1 tl (as nil RefSL3_t) ))
			(skl11 Z1 tl )
			(skl21 tl ex )
		)

		)

		)

	)
)

(define-fun-rec skl3 ((hd RefSL3_t)(ex RefSL3_t)) Bool
	(or 
		(and 
			(= hd ex)
			(_ emp RefSL3_t SL3_t)
		)

		(exists ((tl RefSL3_t)(Z1 RefSL3_t)(Z2 RefSL3_t))
	 
		(and 
			(distinct hd ex)
		(sep 
			(pto hd (c_SL3_t Z1 Z2 tl ))
			(skl1 Z1 Z2 )
			(skl2 Z2 tl )
			(skl3 tl ex )
		)

		)

		)

	)
)

(define-fun-rec skl31 ((hd RefSL3_t)(ex RefSL3_t)) Bool
	(or 
		(and 
			(= hd ex)
			(_ emp RefSL3_t SL3_t)
		)

		(exists ((tl RefSL3_t)(Z1 RefSL3_t)(Z2 RefSL3_t))
	 
		(and 
			(distinct hd ex)
		(sep 
			(pto hd (c_SL3_t Z1 Z2 tl ))
			(skl11 Z1 Z2 )
			(skl21 Z2 tl )
			(skl31 tl ex )
		)

		)

		)

	)
)

(check-sat) 
;; variables
(declare-const x1 RefSL3_t)
(declare-const x2 RefSL3_t)
(declare-const x2_0_1 RefSL3_t)
(declare-const x2_1 RefSL3_t)
(declare-const x2_2 RefSL3_t)
(declare-const x2_2_1 RefSL3_t)
(declare-const x2_2_2 RefSL3_t)
(declare-const x2_2_3 RefSL3_t)
(declare-const x2_2_4 RefSL3_t)
(declare-const x2_3 RefSL3_t)
(declare-const x3 RefSL3_t)
(declare-const x4 RefSL3_t)
(declare-const x5 RefSL3_t)
(declare-const x6 RefSL3_t)

(assert 
		(sep 
			(skl3 x4 x5 )
			(skl3 x5 x6 )
			(pto x2 (c_SL3_t x2_0_1 x2_1 x3 ))
			(skl1 x2_0_1 x2_1 )
			(skl2 x2_1 x2_2 )
			(pto x2_2 (c_SL3_t x2_2_1 x2_3 (as nil RefSL3_t) ))
			(skl1 x2_2_1 x2_2_2 )
			(pto x2_2_2 (c_SL3_t x2_2_3 (as nil RefSL3_t) (as nil RefSL3_t) ))
			(pto x2_2_3 (c_SL3_t x2_2_4 (as nil RefSL3_t) (as nil RefSL3_t) ))
			(skl1 x2_2_4 x2_3 )
			(skl21 x2_3 x3 )
			(skl3 x3 (as nil RefSL3_t) )
		)

)

(assert (not
		(sep
			(skl31 x2 (as nil RefSL3_t) )
			(skl3 x4 x6 )
		)
))

(check-sat)
