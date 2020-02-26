function [EmpMat] = constructEmpireMatrixWithPauliSpinors(EmpireVector)

%O = [1 0; 0 -1]; % sigma_z = sigma_3 = O
%L = [0 -i; i 0]; % sigma_y = sigma_2 = -1
%S = [0 1; 1 0]; % sigma_x = sigma_1 = 1
O = [1 0; 0 -1]; % tile = 0
L = [0 1; 1 1]; % tile = -1
S = [1 1; 1 0]; % tile  = 1
%1=LL, 2=LS, 3=SL
if EmpireVector(1) == 0
    EmpMat = O; 
elseif EmpireVector(1) == -1
    EmpMat = L;
elseif EmpireVector(1) == 1
    EmpMat = S;
end

for k=2:length(EmpireVector)
   if EmpireVector(k) == 0
       EmpMat = EmpMat*O;%kron(EmpMat,O);
   elseif EmpireVector(k) == -1
       EmpMat = EmpMat*L;%kron(EmpMat,L);
   elseif EmpireVector(k) == 1
       EmpMat = EmpMat*S;%kron(EmpMat,S);
   end
end

%%%%%%%%%%
