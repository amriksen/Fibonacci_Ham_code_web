function [newFibLattice newVC H_now H_prop proposedFibLattice] = singleFlipMonteCarloStep1D(FibLattice, ...
    temperature, flip_location, coeff_B, coeff_M, fibN, H_prev)

%This function computes a single Monte Carlo step
% flip_location is the coordinate of the right tile of the flipped VC

beta = 1/temperature; % so temperature here is scaled by Boltzmann constant K_B

% find the type of flip
% below, proposedVC is the proposed flipped state of oldVC
oldVC = Detect_VC(FibLattice, flip_location);
proposedVC = flipVC(oldVC); 
proposedFibLattice = flipFibLattice(FibLattice, proposedVC, flip_location); 
% START compute proposed state energy H_prop -- LINEAR TERM
[H_prop] = calculateHAM(proposedFibLattice, coeff_B, coeff_M, fibN);
% END compute proposed state energy H_prop -- LINEAR TERM

% decide to kep the flip or not based on energetic principles
if H_prop <= H_prev
    newFibLattice = proposedFibLattice;
    newVC = proposedVC;
    H_now = H_prop;
elseif H_prop > H_prev
    if rand <= exp(-beta*(H_prop - H_prev))
        newFibLattice = proposedFibLattice;
        newVC = proposedVC;
        H_now = H_prop; 
    else
        newFibLattice = FibLattice;
        newVC = oldVC;
        H_now = H_prev; 
    end
end


        
    
% 





