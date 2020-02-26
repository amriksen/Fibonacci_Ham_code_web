function VC = Detect_VC_phi(fibo_lattice, rand_coordinate)

phi = (1+sqrt(5))/2;
if fibo_lattice(rand_coordinate) >1%== -1 L
    if fibo_lattice(rand_coordinate-1) >1%== -1 L
        VC = 1; 
    elseif fibo_lattice(rand_coordinate-1) ==1 %== 1 S
        VC = 3; 
    end
elseif fibo_lattice(rand_coordinate) ==1 %== 1 S
    if fibo_lattice(rand_coordinate-1) >1 %== -1 L
        VC = 2; 
    else %fibo_lattice(rand_coordinate-1) == 1
        VC = 0; % defect because SS is not allowed
    end 
end