clc;
close all;
clear;
disp("********************************************************")
disp("*               1. Rosenbrock function                 *")
disp("*                2. Zakharov function                  *")
disp("*                  3. Perm function                    *")
disp("*                  4. Trid function                    *")
disp("*         5. Rotated Hyper-Ellipsoid Function          *")
disp("*                                                      *")
disp("**************     Choose one number     ***************")
disp("********************************************************")
func = input("Type your selection: ");
n = input("Type dimensions (N): ");
k = input("Type K: ");
x = sym('x',[n 1]);

switch func
    case 1
        rosenbrock(n,x,k);        
    case 2
        zakharov(n,x,k);         
    case 3        
        perm(n,x,k);        
    case 4        
        trid(n,x,k);        
    case 5
        hyper_ellipsoid(n,x,k);        
    otherwise
        disp('Invalid value!!')
end

