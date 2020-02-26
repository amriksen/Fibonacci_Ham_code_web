clear all; 
phi = (1 + sqrt(5))/2; 
phiConj = -1/phi;
fibN=5;
Fib_Word_fibN = Fibonacci_Word_length_FibN(fibN); 
fib_lattice_orig = Make_Fibonacci_lattice(Fib_Word_fibN);
%fib_lattice_orig = [-1  1  -1  1  -1 -1 1];
% x1 = 21; x2 = 57
% VC1 = Detect_VC(fib_lattice_orig, x1);
% VC2 = Detect_VC(fib_lattice_orig, x2);
% E1vec = Enlist_empire1D_CutProj(fib_lattice_orig, VC1, x1,fibN);
% E2vec = Enlist_empire1D_CutProj(fib_lattice_orig, VC2, x2,fibN);
% inner = dot(E1vec,E2vec)
% s=9; 
%fib_lattice_orig = [-1,1,-1,-1,1,-1,1,-1,-1,1,-1,-1,1,-1,1,-1,-1,1,-1,1,-1,-1,1,-1,-1,1,-1,1,-1,-1,1,-1,-1,1,-1,1,-1,-1,1,-1,1,-1,-1,1,-1,-1,1,-1,1,-1,-1,1,-1,1,-1,-1,1,-1,-1,1,-1,1,-1,-1,1,-1,-1,1,-1,1,-1,-1,1,-1,1,-1,-1,1,-1,-1,1,-1,1,-1,-1,1,-1,-1,1];
%fibN = 10;
%fib_lattice_orig =[-1,1,-1,-1,1,-1,1,-1,-1,1,-1,-1,1,-1,1,-1,-1,1,-1,1,-1,-1,1,-1,-1,1,-1,1,-1,-1,1,-1,-1,1,-1,1,-1,-1,1,-1,1,-1,-1,1,-1,-1,1,-1,1,-1,-1,1,-1,1,-1];
%fibN = 9; 
%fib_lattice_orig = [-1,1,-1,-1,1,-1,1,-1,-1,1,-1,-1,1,-1,1,-1,-1,1,-1,1,-1];
%fibN = 7
%fib_lattice_orig =[-1,1,-1,-1,1,-1,1,-1,-1,1,-1,-1,1,-1,1,-1,-1,1,-1,1,-1,-1,1,-1,-1,1,-1,1,-1,-1,1,-1,-1,1];
%fibN = 8
%fib_lattice_orig = [-1  1 -1 -1  1 -1  1 -1 -1  1 -1 -1  1]; %fib_lattice_orig = [1  -1  1  1  -1 1  -1 1  1  -1 1  1  -1];
%fibN = 6
%fib_lattice_orig = [-1 1 -1 -1  1 -1  1 -1];
%fibN = 5;
%fib_lattice_orig = [1 -1  1 -1 -1];%[-1 1 -1 -1 1];
%fibN = 4;
%fib_lattice_orig = [-1 1 -1];
%fibN = 3; 

N=0; 
fib_lattice_orig = [-1    -1     1    -1    -1     1    -1    -1];
fib_lattice = fib_lattice_orig; 
%eps = 0;%0.001;
tol = 0.1; 
pL = phi/(1+phi);  pS = 1/(1+phi);
lenfib = length(fib_lattice); 
HamMatNL_temp = zeros(lenfib);%zeros(2);%%zeros(2^lenfib);
HamMatLin_temp = zeros(lenfib);

for i=2:lenfib
    VC1 = Detect_VC(fib_lattice, i);
    x1 = i
    E1vec = Enlist_empire1D_CutProj(fib_lattice, VC1, x1,fibN);
    %HamMatLin_temp = HamMatLin_temp + diag(E1vec);
    for j=i:lenfib
        VC2 = Detect_VC(fib_lattice, j);
        x2 = j;
        N=N+1;
        E2vec = Enlist_empire1D_CutProj(fib_lattice, VC2, x2,fibN);
        EmpMat = kron(E1vec,E2vec');
        HamMatNL_temp = (HamMatNL_temp + EmpMat);
    end
end
HamMat_temp = -(HamMatLin_temp + HamMatNL_temp)/lenfib;
HamMat = (HamMat_temp + HamMat_temp')/2;% - diag([diag(HamMat_temp)]);
HamMatSign = sign(HamMat);

[Eham, eham] = eig(HamMat)
[EHs, eHs] = eig(HamMatSign);
evs = diag(eham);
ev_min = evs(1);

% D1 = zeros(length(evs));
% D1(1,1) = ev_min;
% H1 = Eham*D1*Eham'; % rank 1 approximation of HamMat

trace_Ham_normalized = trace(HamMat)/lenfib
det_Ham = det(HamMat);

EigenState = Eham(:,1)'
fib_state = fib_lattice/sqrt(sum(fib_lattice.^2)) % normalized fibonacci_state
            
diff_states = abs(EigenState - fib_state)
% if max(diff_states) < tol
%     sprintf('MATCH: the lowest Eigen-Vector is the Fibonacci state')
% else
%     error('WRONG: Fibonacci state is NOT recovered')
% end
    
    

if (sign(EigenState) == sign(fib_lattice_orig))
    sprintf('MATCH: the lowest Eigen-Vector is the Fibonacci state') 
elseif (sign(EigenState) == -sign(fib_lattice_orig))% because I might as well have chosen L = 1 and S = -1 (the choice of sign was arbitrary)
    sprintf('MATCH: the lowest Eigen-Vector is the Fibonacci state') 
else
    error('WRONG: Fibonacci state is NOT recovered')
end



        




