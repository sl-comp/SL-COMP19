(set-logic QF_SHID)

(set-info :source |
  Jens Katelaan, Harrsh, https://github.com/katelaan/harrsh/
|)
(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :status unsat)
(set-info :version "2019-02-20")

(declare-sort Refnode4 0)

(declare-datatypes
  ((node4 0))
  (((c_node4 (f1 Refnode4) (f2 Refnode4) (f3 Refnode4) (f4 Refnode4)))))

(declare-heap (Refnode4 node4))

(define-funs-rec
  ((tllp ((x1 Refnode4) (x2 Refnode4) (x3 Refnode4) (x4 Refnode4)) Bool))
  ((or
      (and (= x1 x2) (pto x1 (c_node4 (as nil Refnode4) (as nil Refnode4) x3 x4)))
      (exists
        ((l Refnode4) (m Refnode4) (r Refnode4))
        (sep (pto x1 (c_node4 l r (as nil Refnode4) x4)) (tllp l x2 m x1) (tllp r m x3 x1))))))

(declare-const x1 Refnode4)
(declare-const x2 Refnode4)
(declare-const x3 Refnode4)
(declare-const x4 Refnode4)

(assert (tllp x1 x2 x3 x4))

(assert (not (tllp x1 x2 x3 x4)))

(check-sat)