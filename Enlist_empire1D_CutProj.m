function empire_Vector = Enlist_empire1D_CutProj(fibo_lattice, VC, rand_coord,fibN)


lattice2D = constructMotherLattice2Dfor1DChain(fibo_lattice); 

if rand_coord == 2
    VC_left(1) = 0; % end x coord of the left tile of VC
    VC_left(2) = 0; % end y coord of the left tile of VC
else
    VC_left(1) = lattice2D(1,rand_coord-2); % end x coord of the left tile of VC
    VC_left(2) = lattice2D(2,rand_coord-2); % end y coord of the left tile of VC
end

VC_mid(1) = lattice2D(1,rand_coord-1); % mid x coord of the left-right tile of VC
VC_mid(2) = lattice2D(2,rand_coord-1); % mid y coord of the left-right tile of VC

VC_right(1) = lattice2D(1,rand_coord); % end x coord of the right tile of VC
VC_right(2) = lattice2D(2,rand_coord); % end y coord of the right tile of VC

Empire_win_ymax = max([VC_left(2), VC_mid(2), VC_right(2)]);
Empire_win_ymin = min([VC_left(2), VC_mid(2), VC_right(2)]);


isONEaforcedTile = 0; 
empire_Vector = zeros(1,length(fibo_lattice)); 
for i = 2:length(fibo_lattice)
    if ( (lattice2D(2,i) <= Empire_win_ymax && lattice2D(2,i) >= Empire_win_ymin) ...
            && (lattice2D(2,i-1) <= Empire_win_ymax && lattice2D(2,i-1) >= Empire_win_ymin) )
        empire_Vector(i) = fibo_lattice(i); 
        if i==2
            isONEaforcedTile = 1;
        end
            
    end
end

if isONEaforcedTile == 1
    empire_Vector(1) = fibo_lattice(1); 
end


