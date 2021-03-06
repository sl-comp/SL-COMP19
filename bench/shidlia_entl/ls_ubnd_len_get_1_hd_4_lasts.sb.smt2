(set-logic SHIDLIA)
(set-info :source | Songbird - https://songbird-prover.github.io/ |)
(set-info :smt-lib-version 2)
(set-info :category "crafted")
(set-info :status unsat)

;; singleton heap

(declare-sort Refnode 0)

(declare-datatypes
 ((node 0))
 (((c_node (next Refnode)))))

(declare-heap (Refnode node))

;; heap predicates

(define-fun-rec ls ((x_1 Refnode) (y_2 Refnode) (n_3 Int)) Bool
  (or
   (and
    (_ emp Refnode node)
    (and
     (= n_3 0)
     (= x_1 y_2)))
   (exists
    ((u_4 Refnode) (k Int))
    (and
     (sep
      (pto x_1 (c_node u_4))
      (ls u_4 y_2 k))
      (= k (- n_3 1))
     (<= 0 (- n_3 1))))))

(check-sat)

;; entailment: ls(x,y,n) & 1000<=n |- (exists u,v,t,w,r. r->node{y} * t->node{w} * v->node{t} * w->node{r} * x->node{u} * ls(u,v,n-5))

(declare-const x Refnode)
(declare-const y Refnode)
(declare-const n Int)

(assert
 (and
  (ls x y n)
  (<= 1000 n)))

(assert
 (not
  (exists
   ((u Refnode) (v Refnode) (t Refnode) (w Refnode) (r Refnode) (k Int))
   (and
   (sep
    (pto r (c_node y))
    (pto t (c_node w))
    (pto v (c_node t))
    (pto w (c_node r))
    (pto x (c_node u))
    (ls u v k))
    (= k (- n 5))))))

(check-sat)
