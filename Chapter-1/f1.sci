clc; clear; clf;

deff('y = f(x)', 'y = exp(x) - 3*x ');
deff('y = df(x)', 'y = exp(x) - 3');
tol = 1e-8;
x0 = 0.5;

// adapted functions

function [y, n, x_seq] = NEWTON(f, df, x0, e)
    max_iter = 10000;
    r_curr = x0;
    y = x0;
    n = 0;
    err = %inf;
    x_seq = [x0];
    while (err > e && n < max_iter)
        if (df(r_curr) == 0) then
            printf("Warning: stopping early because derivative is 0\n");
            y = r_curr;
            break;
        end
        n = n + 1;
        y = r_curr - (f(r_curr) / df(r_curr));
        x_seq($+1) = y;
        err = abs(y - r_curr);
        r_curr = y;
    end
endfunction

function [y, x_seq] = SECANTE(r0, r1, fonc, n)
    r_prev = r0;
    r_curr = r1;
    y = r1;
    x_seq = [r1];
    
    for i = 1:n
        if ( abs(r_curr - r_prev) <= tol) then
            y = r_curr;
            break;
        end
        if (fonc(r_curr) - fonc(r_prev)) == 0 then
            y = r_curr;
            break;
        end
        y = r_curr - ((r_curr - r_prev) / (fonc(r_curr) - fonc(r_prev))) * fonc(r_curr);
        x_seq($+1) = y;
        r_prev = r_curr;
        r_curr = y;
    end
endfunction

function [y, n, x_seq] = OSTROWSKI(f, df, x0, e)
    max_iter = 10000;
    r_curr = x0;
    y = x0;
    n = 0;
    err = %inf;
    x_seq = [x0];
    
    while (err > e && n < max_iter)
        if (df(r_curr) == 0) then
            printf("Warning: stopping early because derivative is 0\n");
            y = r_curr;
            break;
        end
        n = n + 1;
        k = r_curr - (f(r_curr) / df(r_curr));
        if (f(r_curr) - 2 * f(k)) == 0 then
            y = k;
            x_seq($+1) = y;
            break;
        end
        y = k - (f(r_curr) / (f(r_curr) - 2 * f(k))) * (f(k) / df(r_curr));
        x_seq($+1) = y;
        err = abs(y - r_curr);
        r_curr = y;
    end
endfunction

// print table function

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

// print tables

[y_new, n_new, x_new] = NEWTON(f, df, x0, tol);
[y_sec, x_sec]        = SECANTE(0, 1.0, f, 10);
[y_ost, n_ost, x_ost] = OSTROWSKI(f, df, x0, tol);

print_table("1. NEWTON METHOD (Theoretical Order p = 2)", x_new);
print_table("2. SECANT METHOD (Theoretical Order p = 1.618)", x_sec);
print_table("3. OSTROWSKI METHOD (Theoretical Order p = 4)", x_ost);

// Efficiency Index
p_new = 2; m_new = 2;
p_sec = (1 + sqrt(5)) / 2; m_sec = 1;
p_ost = 4; m_ost = 3;
E_new = p_new^(1 / m_new);
E_sec = p_sec^(1 / m_sec);
E_ost = p_ost^(1 / m_ost);

printf("\n=========================================================================\n");
printf(" Efficiency Index Comparision (E = p^(1/m)):\n");
printf("=========================================================================\n");
printf("Method\t\t Order (p)\t Funct eval (m)\t Efficiency Index (E)\n");
printf("-------------------------------------------------------------------------\n");
printf("Newton\t\t %.4f\t\t %d\t\t %.4f\n", p_new, m_new, E_new);
printf("Secant\t\t %.4f\t\t %d\t\t %.4f\n", p_sec, m_sec, E_sec);
printf("Ostrowski\t %.4f\t\t %d\t\t %.4f\n", p_ost, m_ost, E_ost);
printf("=========================================================================\n");
// plot


plot(0:length(x_sec)-1, abs(f(x_sec)), 'b-o', 'LineWidth', 2, 'MarkerSize', 6);
plot(0:length(x_new)-1, abs(f(x_new)), 'r-s', 'LineWidth', 2, 'MarkerSize', 6);
plot(0:length(x_ost)-1, abs(f(x_ost)), 'g-d', 'LineWidth', 2, 'MarkerSize', 6);

xgrid();
xlabel('Iteration n');
ylabel('f(r_n)');
title('Convergence Comparison');
legend(['Secant Method (p = 1.618)'; 'Newton Method (p = 2)'; 'Ostrowski Method (p = 4)'], 1);
