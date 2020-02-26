function VC = Detect_VC(fibo_lattice, rand_coordinate)

if fibo_lattice(rand_coordinate) < 0%== -1
    if fibo_lattice(rand_coordinate-1) < 0%== -1
        VC = 1; 
    elseif fibo_lattice(rand_coordinate-1) > 0 %== 1
        VC = 3; 
    end
elseif fibo_lattice(rand_coordinate) > 0 %== 1
    if fibo_lattice(rand_coordinate-1) < 0 %== -1
        VC = 2;
    else %fibo_lattice(rand_coordinate-1) == 1
        VC = 0; % defect because SS is not allowed
    end 
end