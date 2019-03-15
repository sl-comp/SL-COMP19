(set-logic QF_SHID)

(set-info :source |
  Jens Katelaan, Harrsh, https://github.com/katelaan/harrsh/
|)
(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :status unsat)
(set-info :version "2019-02-20")

(declare-sort Refnode2 0)

(declare-datatypes ((node2 0)) (((c_node2 (f1 Refnode2) (f2 Refnode2)))))

(declare-heap (Refnode2 node2))

(define-funs-rec
  ((treefrag ((x1 Refnode2) (x2 Refnode2) (x3 Refnode2)) Bool)
    (treecombined ((x1 Refnode2)) Bool)
    (tree ((x1 Refnode2)) Bool))
  ((and
      (distinct x2 (as nil Refnode2))
      (distinct x3 (as nil Refnode2))
      (pto x1 (c_node2 x2 x3)))
    (exists
      ((l Refnode2) (ll Refnode2) (lr Refnode2) (r Refnode2))
      (sep (pto x1 (c_node2 l r)) (treefrag l ll lr) (tree ll) (tree lr) (tree r)))
    (or
      (pto x1 (c_node2 (as nil Refnode2) (as nil Refnode2)))
      (exists ((y Refnode2) (z Refnode2)) (sep (pto x1 (c_node2 y z)) (tree y) (tree z))))))

(declare-const x1 Refnode2)

(assert (treecombined x1))

(assert (not (tree x1)))

(check-sat)