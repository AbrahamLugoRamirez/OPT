function hyper_ellipsoid(n,x,k)
    f = 0;
    for i = 1:n
        inner = 0;
        for j = 1:i
            inner = inner + x(j)^2;
        end
        f = f + inner;
    end
    gf = x*0;
    vec = 2*n:-2:2;
    vec = vec';
    gf(1:end) = vec(1:end).*x(1:end);
    i = 1:n;
    Hf = sparse(i, i, vec(i));
    start = 0.001.* ones(n,1);
    double(subs(f,x,start))    
    gfk = double(subs(gf,x,start));
    Hfk = double(subs(Hf,x,start));
    pk = -Hfk\gfk;
    tic    
    algorithm(f, gf, Hf, k, start, n, pk, x);    
    toc    
end