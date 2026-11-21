clc; clear; clf;

deff('y = f(x)', 'y = x.^3 - 6 * x.^2 + 12 * x - 6');
deff('y = df(x)', 'y = 3 * x.^2 - 12 * x + 12');

tol = 1e-8;
x0 = 3;

function [x_seq] = BISECTION(f, a, b, e)
    max_iter = 10000;
    n = 0;
    err = (b - a) / 2;
    x_seq = [];
    while (err > e && n < max_iter)
        m = (a + b) / 2;
        x_seq($+1) = m;
        
        if f(m) == 0 then
            break;
        elseif (f(a) * f(m) < 0) then
            b = m;
        else
            a = m;
        end
        
        n = n + 1;
        err = (b - a) / 2;
    end
endfunction

function print_table(method_name, x_seq)
    N = length(x_seq) - 1;
    printf("\n======================================================================================================================\n");
    printf(" %s\n", method_name);
    printf("======================================================================================================================\n");
    printf("n\t x_n\t\t f(x_n)\t\t d_n=|x_(n+1)-x_n|\t r_n=d_n/d_(n-1)\t ln(r_n)\t p_n\n");
    printf("----------------------------------------------------------------------------------------------------------------------\n");
    
    d = zeros(1, N);
    r = zeros(1, N);
    ln_r = zeros(1, N);
    p = zeros(1, N);
    
    for index = 1:N
        n = index - 1;
        xn = x_seq(index);
        fxn = f(xn);
        d(index) = abs(x_seq(index+1) - xn);
        
        if index == 1 then
            printf("%d\t %.9f\t %.3e\t %.3e\t\t -\t\t\t -\t\t -\n", n, xn, fxn, d(index));
        elseif index == 2 then
            r(index) = d(index) / d(index-1);
            ln_r(index) = log(r(index));
            printf("%d\t %.9f\t %.3e\t %.3e\t\t %.3e\t\t %.4f\t -\n", n, xn, fxn, d(index), r(index), ln_r(index));
        else
            r(index) = d(index) / d(index-1);
            ln_r(index) = log(r(index));
            p(index) = ln_r(index) / ln_r(index-1);
            printf("%d\t %.9f\t %.3e\t %.3e\t\t %.3e\t\t %.4f\t %.4f\n", n, xn, fxn, d(index), r(index), ln_r(index), p(index));
        end
    end
endfunction

// print table

[x_bis] = BISECTION(f, 0, 4, tol);
print_table("BISECTION METHOD (Theoretical Order p = 1)", x_bis);

// efficiency index
p_bis = 1; 
m_bis = 1; 
E_bis = p_bis^(1 / m_bis);

printf("\n=========================================================================\n");
printf(" Efficiency Index (E = p^(1/m)):\n");
printf("=========================================================================\n");
printf("Method\t\t Order (p)\t Funct eval (m)\t Efficiency Index (E)\n");
printf("-------------------------------------------------------------------------\n");
printf("Bisection\t %.4f\t\t %d\t\t %.4f\n", p_bis, m_bis, E_bis);
printf("=========================================================================\n");

// plot
x_val = -20:20;
subplot(2, 1, 1);
plot(0:length(x_bis)-1, abs(f(x_bis)), 'b-o', 'LineWidth', 2, 'MarkerSize', 6);
title('Bisection method for the ploynomial');
xlabel('Iteration n');
ylabel('|f(x_n)|');
subplot(2, 1, 2);
plot(x_val, df(x_val), 'r--', 'LineWidth', 2, 'MarkerSize', 6);
title('The derivative of f');
xlabel('X-axis');
ylabel('Y-axis');
xgrid();

title('Bisection method for the ploynomial');
legend(['Bisection Method (p = 1)','Derivative'], 1);
