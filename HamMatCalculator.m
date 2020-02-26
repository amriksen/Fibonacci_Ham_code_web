function [HamMat,Eham, eham] = HamMatCalculator(fib_lattice,fibN,lenfib)

HamMatNL_temp = zeros(lenfib);

for i=2:lenfib
    VC1 = Detect_VC(fib_lattice, i);
    x1 = i;
    E1vec = Enlist_empire1D_CutProj(fib_lattice, VC1, x1,fibN);
    %HamMatLin_temp = HamMatLin_temp + diag(E1vec);
    for j=i:lenfib
        VC2 = Detect_VC(fib_lattice, j);
        x2 = j;
        E2vec = Enlist_empire1D_CutProj(fib_lattice, VC2, x2,fibN);
        EmpMat = kron(E1vec,E2vec');
        HamMatNL_temp = (HamMatNL_temp + EmpMat);
    end
end
HamMat_temp = -(HamMatNL_temp)/lenfib;
HamMat = (HamMat_temp + HamMat_temp')/2;% - diag([diag(HamMat_temp)]);
%HamMatSign = sign(HamMat);

[Eham, eham] = eig(HamMat);
%[EHs, eHs] = eig(HamMatSign);

%trace_Ham_normalized = trace(HamMat)/lenfib

end% of function 