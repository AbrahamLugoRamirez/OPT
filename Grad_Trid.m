function g = Grad_Trid(x)
 gf = -2+0*x;
 gf(1:end-1) = gf(1:end-1) - x(2:end);
 gf(2:end) = gf(2:end) - x(1:end-1);
 gf(1:end) = gf(1:end) + 2*x(1:end);
 g  = gf;
end