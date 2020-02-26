function [EmpMatFib] = constructFibonacciMatrix(fib_lattice)
 
% O = [1 0; 0 -1]; % sigma_z = sigma_3 = O
% L = [0 -i; i 0]; % sigma_y = sigma_2 = -1
% S = [0 1; 1 0]; % sigma_x = sigma_1 = 1
% %1=LL, 2=LS, 3=SL
O = [1 0; 0 -1]; % tile = 0
L = [0 1; 1 1]; % tile = -1
S = [1 1; 1 0]; % tile  = 1
%1=LL, 2=LS, 3=SL

if fib_lattice(1) == 0
    EmpMatFib = O; 
elseif fib_lattice(1) == -1
    EmpMatFib = L;
elseif fib_lattice(1) == 1
    EmpMatFib = S;
end

for k=2:length(fib_lattice)
   if fib_lattice(k) == 0
       EmpMatFib = EmpMatFib*O;%kron(EmpMatFib,O);
   elseif fib_lattice(k) == -1
       EmpMatFib = EmpMatFib*L;%kron(EmpMatFib,L);
   elseif fib_lattice(k) == 1
       EmpMatFib = EmpMatFib*S;%kron(EmpMatFib,S);
   end
end