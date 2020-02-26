clear all; 
fibN=6;
Fib_Word_fibN = Fibonacci_Word_length_FibN(fibN); 
fib_lattice_orig = Make_Fibonacci_lattice(Fib_Word_fibN);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%fib_lattice_orig = fib_lattice_orig(1:10);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n=length(fib_lattice_orig);
clear fib_lattice_orig Fib_Word_fibN

configs = dec2bin(2^n-1:-1:0)-'0';
configs(find(configs == 0)) = -1

numArrays = 2^n;
HamMats = cell(numArrays,1);

figure, 
k=1; 
while k <= 2^n 
    l=1;
% for i=2:n
%     lattice = configs(k,:);
%     VC1 = Detect_VC(lattice, i);
%     x1 = i;
%     E1vec = Enlist_empire1D_CutProj(lattice, VC1, x1,fibN);
%     for j=i:n
%         VC2 = Detect_VC(lattice, j);
%         x2 = j;
%         E2vec = Enlist_empire1D_CutProj(lattice, VC2, x2,fibN);
%         EmpMat = kron(E1vec,E2vec');
%         EmpMat = -(EmpMat + EmpMat')/2;
%         [V,D] = eig(EmpMat);
%         traceEmpMat(k,l) = trace(D);
%         l=l+1;
%     end
% end
[HamMat,Eham, eham] = HamMatCalculator(configs(k,:),fibN,n);


HamMats{k} = HamMat;
Ehams{k} = Eham;
ehams{k} = eham;
lambda(k,:) = diag(ehams{k});
 k=k+1
%plot([1:n*(n-1)/2],traceEmpMat); hold on; 
end


 save N13_specAnalysis.mat configs HamMats Ehams ehams lambda


     
