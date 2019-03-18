(set-logic QF_SHID)

(set-info :source |
  Jens Katelaan, Harrsh, https://github.com/katelaan/harrsh/
|)
(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :status sat)
(set-info :version "2019-02-20")

(declare-sort Refnode3 0)

(declare-datatypes
  ((node3 0))
  (((c_node3 (f1 Refnode3) (f2 Refnode3) (f3 Refnode3)))))

(declare-heap (Refnode3 node3))

(define-funs-rec
  ((dlgrid3 ((x1 Refnode3) (x2 Refnode3) (x3 Refnode3)) Bool)
    (dlgrid2 ((x1 Refnode3) (x2 Refnode3) (x3 Refnode3)) Bool)
    (right ((x1 Refnode3) (x2 Refnode3) (x3 Refnode3)) Bool)
    (dlgrid ((x1 Refnode3) (x2 Refnode3) (x3 Refnode3)) Bool))
  ((exists
      ((u Refnode3) (v Refnode3))
      (sep (pto x1 (c_node3 u x2 x3)) (right x2 v x3) (dlgrid u v x3)))
    (exists
      ((u Refnode3) (v Refnode3))
      (sep (pto x1 (c_node3 u x2 x3)) (right x2 v x1) (dlgrid3 u v x1)))
    (pto x1 (c_node3 x2 (as nil Refnode3) x3))
    (or
      (pto x1 (c_node3 (as nil Refnode3) x2 x3))
      (exists
        ((y Refnode3) (z Refnode3))
        (sep (pto x1 (c_node3 y x2 x3)) (right x2 z x1) (dlgrid y z x1))))))

(declare-const x1 Refnode3)
(declare-const x2 Refnode3)

(assert (dlgrid2 x1 x2 (as nil Refnode3)))

(assert (not (dlgrid x1 x2 (as nil Refnode3))))

(check-sat)
