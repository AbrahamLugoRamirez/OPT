function zakharov(n,x,k)
    sum1 = 0;
    sum2 = 0;
     for i = 1:n
         sum1 = sum1 + x(i)^2;
         sum2 = sum2+0.5*i*x(i);
     end
     f = sum1+sum2^2+sum2^4;  
    start = 0.0001* ones(n,1);    
    gf = gradient(f);
    Hf = hessian(f);    
    gfk = double(subs(gf,x,start));
    Hfk = double(subs(Hf,x,start));
    pk = -Hfk\gfk;
    tic
    algorithm(f, gf, Hf, k, start, n, pk, x);
    toc
end