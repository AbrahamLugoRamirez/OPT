function rosenbrock(n,x,k)
    f = 0;
    for i= 1: n-1
        f = f + (100*(x(i+1)-x(i)^2)^2 + (x(i)-1)^2);
    end    
    start = 0.999.* ones(n,1);    
    gf = Grad_Rosenbrock(x) 
    i = 1:n;
    Hfk = Hess_Rosenbrock(start,i, n)    
    Hess = Hfk;    
    gfk = double(subs(gf,x,start));
    pk = -Hfk\gfk;
    tic 
    algorithm(f, gf, Hess, k, start, n, pk, x);
    toc
end