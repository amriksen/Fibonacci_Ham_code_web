function [HAMnow] = calculateHAM(FibLattice, coeff_B, coeff_M, fibN)

H_prev_lin = 0; H_prev_nonlin = 0; 
%START computing linear and nolinear part of Ham simultaneously  
for n=2:length(FibLattice) % left bdy is 2, right bdy is length(FibLattice)-1
    vertConf1 = Detect_VC(FibLattice, n);
    %if vertConf1 == 0, continue; end % if VC=SS, skip compuating energy (NOTE: Change bc of ##)
    temp_Emp1 = Enlist_empire1D_CutProj(FibLattice, vertConf1, n, fibN);
    H_prev_lin = H_prev_lin + sum(coeff_B.*temp_Emp1); 
    for m=n:length(FibLattice) 
        vertConf2 = Detect_VC(FibLattice, m);
        %if vertConf2 == 0, continue; end % if VC=SS, skip compuating energy (NOTE: Change bc of ##)
        temp_Emp2 = Enlist_empire1D_CutProj(FibLattice, vertConf2, m, fibN);
        H_prev_nonlin = H_prev_nonlin +  sum(coeff_M.*(temp_Emp1.*temp_Emp2)); 
    end
end
%END computing linear and nolinear part of Ham simultaneously  


HAMnow = -(H_prev_lin + H_prev_nonlin);

% ## An over defective chain should have higher energy, and thus the MCMC
% algo must prohibit moving towards a chain with more no. of defects. So we
% must tweak the code to compute the Ham contribution of the defective VCs,
% i.e. in the 1D case SS must be included in the Ham calculation at every
% iteration. This acts as an error correcting mechanism. 




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% START compute previous state energy H_prop -- LINEAR TERM
% H_prev_lin = 0; 
% for n=2:length(FibLattice) % left bdy is 2, right bdy is length(FibLattice)
%     vertConf = Detect_VC(FibLattice, n);
%     if vertConf == 0, continue; end % if VC=SS, skip compuating energy
%     temp_Emp = Enlist_empire(FibLattice, vertConf, n,fibN);
%     if length(temp_Emp) == 0 % SS empire is empty
%         H_prev_lin = H_prev_lin; 
%     else
%         H_prev_lin = H_prev_lin + sum(coeff_B*temp_Emp); 
%     end
% end
%H_prev = -H_prev_lin % this will be changed later to include interaction term
% END compute previous state energy H_prop -- LINEAR TERM
%H_prop_lin = 0;
% for n=2:length(proposedFibLattice) % left bdy is 2, right bdy is length(FibLattice)
%     vertConf = Detect_VC(proposedFibLattice, n);
%     if vertConf == 0, continue; end % if VC=SS, skip compuating energy
%     temp_Emp = Enlist_empire(proposedFibLattice, vertConf, n,fibN);
%     if length(temp_Emp) == 0 % SS empire is empty
%         H_prop_lin = H_prop_lin; 
%     else
%         H_prop_lin = H_prop_lin + sum(coeff_B*temp_Emp); 
%     end
% end
%H_prop = -H_prop_lin %  this will be changed later to include interaction term