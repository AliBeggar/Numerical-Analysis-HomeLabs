function [y, n] = OSTROWSKI(f, df, x0, e)
    max_iter = 10000
    r_curr = x0
    n = 0
    err = %inf
    printf("n\t r_n\t\t r_(n+1)\t Tolerance\n")
    printf("----------------------------------------------------------------------\n")
    while(err > e && n < max_iter)
        if (df(r_curr) == 0) then
            printf("Warning: stopping early because derivative is 0\n")
            y = r_curr
            break
        end
        n = n + 1
        k = r_curr - (f(r_curr)/df(r_curr))
        if (f(r_curr) - 2 * f(k)) == 0 then
            y = k
            break
        end
        y = k - (f(r_curr)/(f(r_curr)-2*f(k)))*(f(k)/df(r_curr))
        err = abs(y - r_curr)
        printf("%d\t %.6f\t %.6f\t %.2e\n", n, r_curr, y, err)
        r_curr = y
    end
endfunction
