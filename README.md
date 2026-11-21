# Numerical Analysis (ANUM) - Scilab Labs

This repository contains practical homelabs and algorithmic implementations in **Scilab** for the **Numerical Analysis (ANUM)** course (1CS - École Nationale Supérieure d'Informatique, 2026/2027)[cite: 94].

The objective of these labs is to design, implement, and analyze standard numerical algorithms while developing practical intuition for method selection, convergence behavior, error estimation, and numerical stability[cite: 94, 97, 100].

## Topics & Implemented Methods

### 1. Nonlinear Equations ($f(x) = 0$) [cite: 97]
* **Bisection Method:** Bracketing root-finding based on the Intermediate Value Theorem[cite: 97].
* **Fixed-Point Iteration:** Reformulating $f(x) = 0$ into $x = g(x)$ and verifying contraction mapping conditions[cite: 97].
* **Newton's Method (Newton-Raphson):** Quadratically convergent tangent-based root-finding[cite: 97].
* **Secant Method:** Derivative-free superlinear root-finding ($p \approx 1.618$)[cite: 97].
* **Stopping Criteria:** Increment-based, residual-based, and maximum iteration controls[cite: 97].

### 2. Direct Methods for Linear Systems ($AX = b$) [cite: 100]
* **Gaussian Elimination:** Upper-triangular reduction with partial pivoting and back-substitution[cite: 100].
* **LU & PLU Factorization:** Matrix decomposition for efficient multi-RHS solving[cite: 100].
* **Cholesky Factorization:** Specialized $A = CC^T$ decomposition for symmetric positive-definite (SPD) matrices[cite: 100].
* **Stability & Conditioning:** Analyzing pivot selection, condition numbers ($\text{cond}(A)$), and preconditioning[cite: 100].

### 3. Iterative Methods for Linear Systems ($AX = b$) [cite: 93]
* **Jacobi Method:** Simultaneous component-wise matrix splitting iteration[cite: 93].
* **Gauss-Seidel Method:** Sequential update iteration leveraging newly computed components[cite: 93].
* **Successive Over-Relaxation (SOR):** Parameterized relaxation ($\omega$) to accelerate convergence[cite: 93].
* **Convergence Analysis:** Spectral radius ($\rho(B) < 1$), strict diagonal dominance, and error estimation[cite: 93].

### 4. Eigenvalues & Eigenvectors ($AX = \lambda X$) [cite: 9, 11]
* **Localization & Direct Approaches:** Gershgorin-Hadamard circles and Krylov's method for the characteristic polynomial[cite: 9, 16, 17].
* **Partial Iterative Methods:** Power iteration (dominant eigenvalue $\lambda_1$) and Inverse Power iteration (smallest eigenvalue $\lambda_n$)[cite: 9, 22, 24, 29].
* **Global Iterative Methods:** Classical Jacobi method (via Givens rotations for symmetric matrices), Rutishauser's LR algorithm, and Francis's QR algorithm (including Hessenberg reduction)[cite: 9, 31, 32, 34, 36, 38, 41].

### 5. Polynomial Interpolation & Numerical Integration [cite: 48]
* **Polynomial Interpolation:** Lagrange interpolation polynomials (canonical & Lagrange bases), Newton's Divided Differences (FDD), Finite Differences (FDF) for equidistant nodes, and Runge's phenomenon / error bounds[cite: 48, 54, 58, 59, 62, 65, 85, 86].
* **Numerical Quadrature:** Simple and composite Newton-Cotes formulas (Midpoint/Rectangle, Trapezoidal, Simpson's rule)[cite: 48, 72, 74, 78, 79], general quadrature weights via Vandermonde systems[cite: 89, 90], and Peano kernel error estimates[cite: 76].

## Prerequisites & Tools
* **Software:** [Scilab](https://www.scilab.org/)[cite: 94]
* **Course Reference:** *Numerical Analysis (1CS)* - Pr. H. Haddadou, ESI (2026/2027)[cite: 94]
