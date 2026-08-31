# MA-RBF corrections for IVP solvers

This repository contains the code implemented for the paper: "Order-enhanced time stepping for scalar first-order ODEs with adaptive $C^4$ Matérn RBF corrections". 
In the paper, we develop radial basis function (RBF) corrections for classical fixed-step solvers of scalar first-order ordinary differential equation initial 
value problems (IVPs). The construction uses the $C^4$ Matérn kernel to modify Euler, midpoint, two-step Adams-Bashforth, and one-step Adams-Moulton formulas, 
and to form an Adams-Bashforth-Moulton predictor-corrector scheme. A comparison with classical methods and their MQ-RBF counterparts is presented, covering 
both stability analysis and numerical experiments on three nonlinear IVPs.

*Classical methods for IVP* : contains the implementation of classical methods (Euler, midpoint, two-step/three-step Adams-Bashforth, and two-step 
Adams-Bashforth one-step Adams-Moulton predictor-corrector methods) for solving the IVPs in the form $u'(t) = f(t,u(t))$, $a < t \leq b$, with $u(a)=u_0$
and computing the absolute error at the final point $t=b$.

*RBF methods for IVP* : contains the modified MQ-RBF and MA-RBF versions of Euler, midpoint, two-step Adams-Bashforth, and Adams-Bashforth-Moulton 
predictor-corrector formulas. The desired RBF kernel (Multiquadric or Matérn) can be selected via the function's input arguments.

*Stability regions* : contains the functions for plotting the absolute stability regions in the complex plane of the analyzed one-step and multistep 
methods, comparing the modified RBF versions with classical numerical schemes.

This main file includes the scripts that generate the tables and figures presented in the paper. 
For ease of reference, the numbers following 'tab' and 'fig' in the code strictly match the respective numbering used in the paper.
