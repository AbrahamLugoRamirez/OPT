function g = Grad_Rosenbrock(x)
g = 0*x;
g(1) = 2*x(1);
g(1:end-1) = g(1:end-1)-2;
g(1:end-1) =g(1:end-1) -400*x(1:end-1).*(-x(1:end-1).*x(1:end-1)+x(2:end));
g(2:end) =g(2:end) -200*x(1:end-1).*(x(1:end-1));
g(2:end-1) =g(2:end-1)+ 202*x(2:end-1);
g(end) = g(end)+ 200*x(end);
end