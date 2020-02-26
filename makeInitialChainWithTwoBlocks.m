function [init_chain] = makeInitialChainWithTwoBlocks(FibLattice, leftL)

if mod(length(FibLattice),2) == 0
    if leftL == 1
        init_chain(1:length(FibLattice)/2) = -1;
        init_chain(length(FibLattice)/2 + 1:length(FibLattice)) = 1; 
    else
        init_chain(1:length(FibLattice)/2) = 1;
        init_chain(length(FibLattice)/2 + 1:length(FibLattice)) = -1; 
    end
else %mod(length(FibLattice),2) == 1
    if leftL == 1
        init_chain(1:(length(FibLattice)+1)/2) = -1;
        init_chain((length(FibLattice)+1)/2:length(FibLattice)) = 1; 
    else
        init_chain(1:(length(FibLattice)+1)/2) = 1;
        init_chain((length(FibLattice)+1)/2:length(FibLattice)) = -1; 
    end     
end


