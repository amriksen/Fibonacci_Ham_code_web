clear all;
%  fib_lattice = [-1  1 -1 -1  1 -1  1 -1 -1  1 -1 -1  1]; %fib_lattice_orig = [1  -1  1  1  -1 1  -1 1  1  -1 1  1  -1];
%  fibN = 6
% %fib_lattice =[-1,1,-1,-1,1,-1,1,-1,-1,1,-1,-1,1,-1,1,-1,-1,1,-1,1,-1,-1,1,-1,-1,1,-1,1,-1,-1,1,-1,-1,1,-1,1,-1,-1,1,-1,1,-1,-1,1,-1,-1,1,-1,1,-1,-1,1,-1,1,-1];
% %fibN = 9;
% %fib_lattice = [-1,1,-1,-1,1,-1,1,-1,-1,1,-1,-1,1,-1,1,-1,-1,1,-1,1,-1];
% %fibN = 7
% 
% x = [1:length(fib_lattice)];
% VC(1) = 0; % no VC corresponding to x=1 bc indexing starts from 2
% for i=2:length(fib_lattice)
%     VC(i) = Detect_VC(fib_lattice, x(i));
% end
% 
% x_VC1 = find(VC == 1); x_VC2 = find(VC == 2); x_VC3 = find(VC == 3); 
% 
% %%%%%%%%%%%%%%%%%%%%%%
% VC_a=1;  VC_b=2;   m=1;   n=1; 
% VC_ap=1; VC_bp=2;  mp=2;  np = 2;
%         
% E1vec_a = Enlist_empire1D_CutProj(fib_lattice, VC_a, x_VC1(m),fibN);
% E2vec_b = Enlist_empire1D_CutProj(fib_lattice, VC_b, x_VC2(n),fibN);
% 
% EmpMat1 = kron(E1vec_a,E2vec_b');
% %EmpMat1 = (EmpMat1 + EmpMat1')/2;
% 
% E1vec_ap = Enlist_empire1D_CutProj(fib_lattice, VC_ap, x_VC1(mp),fibN);
% E2vec_bp = Enlist_empire1D_CutProj(fib_lattice, VC_bp, x_VC2(np),fibN);
% 
% EmpMat2 = kron(E1vec_ap,E2vec_bp');
% %EmpMat2 = (EmpMat2 + EmpMat2')/2;
% 
% Comm = EmpMat1*EmpMat2 - EmpMat2*EmpMat1
% 
% Mat1 = [VC_a VC_b x_VC1(m) x_VC2(n)]
% Mat2 = [VC_ap VC_bp x_VC1(mp) x_VC2(np)]

% N=13; A = zeros(N);
% for i = 1:N
%     r = randi([0 1],1,N-i+1);
%     r(find(r==0)) = -1;
%     A(i,i:end) = r;
% end
% 
% A = sign((A+A')/2)
% [EA,eA] = eig(A);
% eA
% detA = det(A)
% trace(A);
% 
% r = randi([0 1],1,N);
% r(find(r==0)) = -1;
% v = r;
% B = kron(v,v');
% B = sign((B+B')/2)
% [EB,eB] = eig(B);
% eB
% detB = det(B)

clear all; 
phi = (1 + sqrt(5))/2; 
phiConj = -1/phi;
fibN=33;
Fib_Word_fibN = Fibonacci_Word_length_FibN(fibN); 
fib_lattice = Make_Fibonacci_lattice(Fib_Word_fibN);

% calculating statistics of frequency of occurences of different VCs
numLL = 0; numLS = 0; numSL = 0;
for i=2:length(fib_lattice)
   if Detect_VC(fib_lattice, i) == 1
       numLL = numLL + 1;
   elseif Detect_VC(fib_lattice, i) == 2
       numLS = numLS + 1;
   elseif Detect_VC(fib_lattice, i) == 3
       numSL = numSL + 1;
   else 
       error('Something is wrong in VC detection')
   end
end




