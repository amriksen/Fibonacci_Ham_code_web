function Fib_lattice = Make_Fibonacci_lattice(Fib_Word)

% This function makes a fibonacci lattice with spacing L(phi, or -1) and S(1)
% using a given fibonacci word

syms x
phi=solve(x^2 - x - 1 == 0, x);

%L = sym(phi(1)); % L is phi = (1+sqrt(5))/2
L=-1; 
tempARRAY1 = Fib_Word.*L; 
tempARRAY2 = Fib_Word + L; 

Fib_lattice = tempARRAY2 - tempARRAY1; 