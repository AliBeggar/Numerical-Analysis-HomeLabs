clc; clear; clf;

deff('y = f(x)', 'y = exp(x) - x - 2')

x = linspace(0, 3, 400)
y = f(x)

plot(x, y, 'b-', 'LineWidth', 2)
xgrid()
xlabel('x')
ylabel('y')
title('Secant Method for f(x) = e^x - x - 2 on [1, 2]')

plot([1, 2], [0, 0], 'k--', 'LineWidth', 1.5)

r_prev = 1.0      // r_(n-1)
r_curr = 2.0      // r_n
tol = 0.000001        // tolerance = 10^-6 = 10e-6
max_iter = 100     // max number of iterations
iter = 0

printf("n\t r_(n-1)\t r_n\t\t r_(n+1)\t Tolerance\n")
printf("----------------------------------------------------------------------------\n")

while abs(f(r_curr) - f(r_prev)) > tol && iter < max_iter
    iter = iter + 1
    
    // secant formula
    r_next = r_curr - ((r_curr - r_prev) / (f(r_curr) - f(r_prev))) * f(r_curr)
    
    printf("%d\t %.6f\t %.6f\t %.6f\t %.2e\n", iter, r_prev, r_curr, r_next, abs(f(r_next)-f(r_curr)))
    
    // line connecting (r_prev, f(r_prev)) & (r_curr, f(r_curr)) with (r_next, 0)
    plot([r_prev, r_curr, r_next], [f(r_prev), f(r_curr), 0], 'r--')
    
    plot(r_prev, f(r_prev), 'ro')
    plot(r_curr, f(r_curr), 'ro')
    plot(r_next, 0, 'gx', 'MarkerSize', 8)
    
    r_prev = r_curr
    r_curr = r_next
end

plot(r_curr, f(r_curr), 'gd', 'MarkerSize', 10)
legend(['f(x) = e^x - x - 2'; 'Interval [1,2]'; 'Secant lines'], 2)

printf("\nAproximate Root: r_(n+1) = %.8f after %d iterations.\n", r_curr, iter)
