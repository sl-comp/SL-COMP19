
# Asterix 

\ASTERIX\ 
The solver deals with the satisfiability and entailment checking in the
|QF_SHLS| fragment.
For this, it implements a model-based approach.
The procedure relies on SMT solving technology (Z3 solver is used) to untangle potential aliasing between program variables.
It has at its core a matching function that checks whether a concrete valuation is a model of the input formula and, if so, generalizes it to a larger class of models where the formula is also valid.

\ASTERIX\ was the winner of divisions |qf_shls_sat| and |qf_shls_entl|
for both editions.


* References
   * J. A. Navarro Perez and A. Rybalchenko. Separation Logic Modulo Theories. In Proc. APLAS’13, 2013.


* Contact
   * Juan Navarro Pérez (at the time at University College London, UK, now at Google) 
    <juannavarroperez@gmail.com>

   * Andrey Rybalchenko (at the time at TU Munich, Germany, now at Microsoft Research Cambridge, UK)
     <rybal@microsoft.com>


