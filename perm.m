function perm(n,x,k)    
    x = sym('x',[n 1]);
    f = 0;
    for i = 1:n
        inner = 0;
        for j = 1:n
            xj = x(j);
            inner = inner + (j+10)*(xj^i-(1/j)^i);
        end
        f = f + inner^2;
    end 
    start = zeros(n,1);
    for k = 1:n
        start(k) = 1/k + .1;
    end    
    gf = gradient(f);
    Hf = hessian(f);  
    gfk = double(subs(gf,x,start));
    Hfk = double(subs(Hf,x,start));
    pk = -Hfk\gfk;
    tic
    algorithm(f, gf, Hf, k, start, n, pk, x);
    toc    
end