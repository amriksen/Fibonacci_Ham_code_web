function [init_chain] = makeInitialChainAlternate(FibLattice, numL, numS)

init_chain(1) = 1; 
for i=2:length(FibLattice)
    init_chain(i) = -sign(init_chain(i-1)); 
end


