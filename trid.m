% Working for: 2 <= n <= 9
function trid(n,x,k)

    sum1 = (x(1)-1)^2;
    sum2 = 0;

    for i = 2:n
        xi = x(i);
        xold = x(i-1);
        sum1 = sum1 + (xi-1)^2;
        sum2 = sum2 + xi*xold;
    end
    f = sum1 - sum2;   
    start = 0.1.* ones(n,1);
    %Gradient
     gf = Grad_Trid(x)

    %Hessian
    Hf = Hess_Trid(n)

    %plot(start(1),start(2),'ok','markersize',8, 'markerfacecolor','k'); % Printing the beginning dot.
    gfk = double(subs(gf,x,start));
    Hfk = double(subs(Hf,x,start));
    pk = -Hfk\gfk;

    tic
    algorithm(f, gf, Hf, k, start, n, pk, x);
    toc
end    