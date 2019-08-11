function algorithm(f, gf, Hf, k, start, n, pk, x)
    
    for i = 1:k     % Quantity of line segments
        xk = start;
        X = matrixB(n,i);
        B = (X*X')*pk;
        b = 1; a = 0;
        da = (b-a)/4;
        a1 = a+da; x1 = xk+a1*B;f1 = double(subs(f,x,x1));
        a2 = a+2*da;x2 = xk+a2*B;f2 = double(subs(f,x,x2));
        a3 = a+3*da; x3 = xk+a3*B;f3 = double(subs(f,x,x3));
        if f1<=f2 && f1 <=f3
            b = a2;
        else
           if f2<=f1 && f2 <= f3
               a = a1; 
               b = a3;
           else
               a = a2;
           end
        end
        aopt = (a+b)/2;
        xk = xk+aopt*B;
        for j=1:5
            gfk = double(subs(gf,x,xk));
            Hfk = double(subs(Hf,x,xk));
            pk = -Hfk\gfk;
            xk1 = xk+pk;
            b = 1; a = 0;
            for ite = 1:3
                da = (b-a)/4;
                a1 = a+da;x1 = xk+a1*pk; f1 = double(subs(f,x,x1));
                a2 = a+2*da;x2 = xk+a2*pk;f2 = double(subs(f,x,x2));
                a3 = a+3*da;x3 = xk+a3*pk; f3 = double(subs(f,x,x3));
                if f1<=f2 && f1 <=f3
                    b = a2;
                else
                    if f2<=f1 && f2 <= f3
                       a = a1; b = a3;
                    else
                       a = a2;
                    end
                end
            end
            aopt = (a+b)/2;
            xk = xk+aopt*pk;
        end
        double(subs(f,x,xk))

    end

end
