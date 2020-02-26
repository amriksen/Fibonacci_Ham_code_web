function proposedFibLattice = flipFibLattice(FibLattice, proposedVC, flip_location);

proposedFibLattice = FibLattice; 
if proposedVC == 1 % LL
    proposedFibLattice(flip_location) = -1; 
    proposedFibLattice(flip_location-1) = -1;
elseif proposedVC == 2 % LS
    proposedFibLattice(flip_location) = 1; 
    proposedFibLattice(flip_location-1) = -1;
elseif proposedVC == 3 % SL
    proposedFibLattice(flip_location) = -1; 
    proposedFibLattice(flip_location-1) = 1;
end
    