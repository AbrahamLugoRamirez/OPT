function hess = Hess_Rosenbrock(aux,i, n)
A = sparse(i(1:end-1),i(1:end-1),1200*aux(1:end-1).*aux(1:end-1)-400*aux(2:end),n,n);
A(1,1) = A(1,1)+2;
B = sparse(i(2:end-1),i(2:end-1),+202,n,n);
B(end, end) = 200;
U = sparse(i(2:end),i(1:end-1),-400*aux(1:end-1),n,n);
hess = A+B+U+U'
end