(set-logic QF_SHID)

(set-info :source |
  Jens Katelaan, Harrsh, https://github.com/katelaan/harrsh/
|)
(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :status unsat)
(set-info :version "2019-02-20")

(declare-sort Refnode3 0)

(declare-datatypes
  ((node3 0))
  (((c_node3 (f1 Refnode3) (f2 Refnode3) (f3 Refnode3)))))

(declare-heap (Refnode3 node3))

(define-funs-rec
  ((tll ((x1 Refnode3) (x2 Refnode3) (x3 Refnode3)) Bool)
    (atll ((x1 Refnode3) (x2 Refnode3) (x3 Refnode3)) Bool))
  ((or
      (and (= x1 x2) (pto x1 (c_node3 (as nil Refnode3) (as nil Refnode3) x3)))
      (exists
        ((l Refnode3) (m Refnode3) (r Refnode3))
        (sep (pto x1 (c_node3 l r (as nil Refnode3))) (tll l x2 m) (tll r m x3))))
    (or
      (and
        (= x1 x2)
        (distinct x1 x3)
        (pto x1 (c_node3 (as nil Refnode3) (as nil Refnode3) x3)))
      (exists
        ((l Refnode3) (m Refnode3) (r Refnode3))
        (and
          (distinct x1 x3)
          (sep (pto x1 (c_node3 l r (as nil Refnode3))) (atll l x2 m) (atll r m x3)))))))

(declare-const x1 Refnode3)
(declare-const x2 Refnode3)
(declare-const x3 Refnode3)

(assert (atll x1 x2 x3))

(assert (not (tll x1 x2 x3)))

(check-sat)
