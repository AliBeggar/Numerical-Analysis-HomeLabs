# Numerical Analysis (ANUM) - Scilab Labs

This repository contains practical homelabs and algorithmic implementations in **Scilab** for the **Numerical Analysis (ANUM)** course (1CS — École Nationale Supérieure d'Informatique, 2026/2027).

The objective of these labs is to design, implement, and analyze standard numerical algorithms while developing practical intuition for method selection, convergence behavior, error estimation, and numerical stability.

## Topics & Implemented Methods

### 1. Nonlinear Equations ($f(x) = 0$)
* **Bisection Method:** Bracketing root-finding based on the Intermediate Value Theorem.
* **Fixed-Point Iteration:** Reformulating $f(x) = 0$ into $x = g(x)$ and verifying contraction mapping conditions.
* **Newton's Method (Newton-Raphson):** Quadratically convergent tangent-based root-finding.
* **Secant Method:** Derivative-free superlinear root-finding ($p \approx 1.618$).
* **Stopping Criteria:** Increment-based, residual-based, and maximum iteration controls.

### 2. Direct Methods for Linear Systems ($AX = b$)
* **Gaussian Elimination:** Upper-triangular reduction with partial pivoting and back-substitution.
* **LU & PLU Factorization:** Matrix decomposition for efficient multi-RHS solving.
* **Cholesky Factorization:** Specialized $A = CC^T$ decomposition for symmetric positive-definite (SPD) matrices.
* **Stability & Conditioning:** Analyzing pivot selection, condition numbers ($\text{cond}(A)$), and preconditioning.

### 3. Iterative Methods for Linear Systems ($AX = b$)
* **Jacobi Method:** Simultaneous component-wise matrix splitting iteration.
* **Gauss-Seidel Method:** Sequential update iteration leveraging newly computed components.
* **Successive Over-Relaxation (SOR):** Parameterized relaxation ($\omega$) to accelerate convergence.
* **Convergence Analysis:** Spectral radius ($\rho(B) < 1$), strict diagonal dominance, and error estimation.

### 4. Eigenvalues & Eigenvectors ($AX = \lambda X$)
* **Localization & Direct Approaches:** Gershgorin-Hadamard circles and Krylov's method for the characteristic polynomial.
* **Partial Iterative Methods:** Power iteration (dominant eigenvalue $\lambda_1$) and Inverse Power iteration (smallest eigenvalue $\lambda_n$).
* **Global Iterative Methods:** Classical Jacobi method (via Givens rotations for symmetric matrices), Rutishauser's LR algorithm, and Francis's QR algorithm (including Hessenberg reduction).

### 5. Polynomial Interpolation & Numerical Integration
* **Polynomial Interpolation:** Lagrange interpolation polynomials (canonical & Lagrange bases), Newton's Divided Differences (FDD), Finite Differences (FDF) for equidistant nodes, and Runge's phenomenon / error bounds.
* **Numerical Quadrature:** Simple and composite Newton-Cotes formulas (Midpoint/Rectangle, Trapezoidal, Simpson's rule), general quadrature weights via Vandermonde systems, and Peano kernel error estimates.

## Prerequisites & Tools
* **Software:** [Scilab](https://www.scilab.org/)
* **Course Reference:** *Numerical Analysis (1CS)* - Pr. H. Haddadou, ESI (2026/2027)
