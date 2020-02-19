(set-logic QF_SHLID)

(set-info :source |
Quang Loc Le lequangloc@gmail.com
|)
(set-info :smt-lib-version 2.0)
(set-info :category "crafted")
(set-info :status unsat)
(set-info :version "2019-01-18")

; Sorts for locations, one by cell sort
(declare-sort RefDll_t 0)

; Types of cells in the heap

(declare-datatypes (
	(Dll_t 0)
	) (
	((c_Dll_t (next RefDll_t) (prev RefDll_t) ))
	)
)

; Type of heap

(declare-heap (RefDll_t Dll_t) 
)

(define-fun-rec dll ((fr RefDll_t)(bk RefDll_t)(pr RefDll_t)(nx RefDll_t)) Bool
	(or 
		(and 
			(= fr nx)
			(= bk pr)
			(_ emp RefDll_t Dll_t)
		)

		(exists ((u RefDll_t))
	 
		(and 
			(distinct fr nx)
			(distinct bk pr)
		(sep 
			(pto fr (c_Dll_t u pr ))
			(dll u bk fr nx )
		)

		)

		)

	)
)

(define-fun-rec dll1 ((fr RefDll_t)(bk RefDll_t)(pr RefDll_t)(nx RefDll_t)) Bool
	(or 
		(and 
			(= fr nx)
			(= bk pr)
			(_ emp RefDll_t Dll_t)
		)

		(exists ((u RefDll_t))
	 
		(and 
			(distinct fr nx)
			(distinct bk pr)
		(sep 
			(pto fr (c_Dll_t u pr ))
			(dll1 u bk fr nx )
		)

		)

		)

	)
)


(check-sat) 
;; variables
(declare-const x_emp RefDll_t)
(declare-const w_emp RefDll_t)
(declare-const y_emp RefDll_t)
(declare-const z_emp RefDll_t)

(assert 
		(and 
			(distinct x_emp w_emp)
			(distinct x_emp z_emp)
		(sep 
			(pto x_emp (c_Dll_t w_emp (as nil RefDll_t) ))
			(dll1 w_emp y_emp x_emp z_emp )
		)

		)

)

(assert (not 
			(dll x_emp y_emp (as nil RefDll_t) z_emp )
))

(check-sat)
