function [y] = SECANTE(r0, r1, fonc, n)
    r_prev = r0
    r_curr = r1
    printf("n\t r_(n-1)\t r_n\t\t r_(n+1)\t Tolerance\n");
    printf("----------------------------------------------------------------------\n");
    for i = 1:n
        if(fonc(r_curr) - fonc(r_prev)) == 0 then
            y = r_curr
            break
        end
        y = r_curr - ((r_curr - r_prev) / (fonc(r_curr) - fonc(r_prev))) * fonc(r_curr)
        printf("%d\t %.6f\t %.6f\t %.6f\t %.2e\n", i, r_prev, r_curr, y, abs(fonc(y)-fonc(r_curr)))
        r_prev = r_curr
        r_curr = y
    end
endfunction
