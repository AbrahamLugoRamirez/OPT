function hess = Hess_Trid(n)
s = sparse((1:n),(1:n),2,n,n);
u = sparse(1:n-1,2:n,-1,n,n);
Hf = s+u+u';
hess = Hf;
end