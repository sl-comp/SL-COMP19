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
  ((dlgridRR
      ((x1 Refnode4) (x2 Refnode4) (x3 Refnode4) (x4 Refnode4) (x5 Refnode4) (x6 Refnode4))
      Bool)
    (dlgridL
      ((x1 Refnode4)
        (x2 Refnode4)
        (x3 Refnode4)
        (x4 Refnode4)
        (x5 Refnode4)
        (x6 Refnode4)
        (x7 Refnode4)
        (x8 Refnode4))
      Bool)
    (dlgridR
      ((x1 Refnode4)
        (x2 Refnode4)
        (x3 Refnode4)
        (x4 Refnode4)
        (x5 Refnode4)
        (x6 Refnode4)
        (x7 Refnode4)
        (x8 Refnode4))
      Bool)
    (dlgridLL
      ((x1 Refnode4) (x2 Refnode4) (x3 Refnode4) (x4 Refnode4) (x5 Refnode4) (x6 Refnode4))
      Bool)
    (bot ((x1 Refnode4) (x2 Refnode4) (x3 Refnode4) (x4 Refnode4)) Bool))
  ((sep (pto x1 (c_node4 x5 x2 x3 (as nil Refnode4))) (bot x2 x6 x4 x1))
    (or
      (exists
        ((b Refnode4) (l Refnode4))
        (sep
          (pto x5 (c_node4 x7 x6 l (as nil Refnode4)))
          (dlgridL x1 x2 x3 x4 l b x5 x8)
          (bot x6 x8 b x5)))
      (sep
        (pto x5 (c_node4 x7 x6 x1 (as nil Refnode4)))
        (dlgridLL x1 x2 x5 x6 x3 x4)
        (bot x6 x8 x2 x5)))
    (or
      (exists
        ((b Refnode4) (r Refnode4))
        (sep
          (pto x1 (c_node4 r x2 x3 (as nil Refnode4)))
          (dlgridR r b x1 x2 x5 x6 x7 x8)
          (bot x2 b x4 x1)))
      (sep
        (pto x1 (c_node4 x5 x2 x3 (as nil Refnode4)))
        (dlgridRR x5 x6 x1 x2 x7 x8)
        (bot x2 x6 x4 x1)))
    (sep (pto x1 (c_node4 x3 x2 x5 (as nil Refnode4))) (bot x2 x4 x6 x1))
    (pto x1 (c_node4 x2 (as nil Refnode4) x3 x4))))

(declare-const x5 Refnode4)
(declare-const x1 Refnode4)
(declare-const x2 Refnode4)
(declare-const x3 Refnode4)
(declare-const x4 Refnode4)
(declare-const x6 Refnode4)
(declare-const x7 Refnode4)
(declare-const x8 Refnode4)

(assert (dlgridR x1 x2 x3 x4 x5 x6 x7 x8))

(assert (not (dlgridL x1 x2 x3 x4 x5 x6 x7 x8)))

(check-sat)