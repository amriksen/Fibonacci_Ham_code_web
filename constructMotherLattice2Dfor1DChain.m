function Mother_Lattice = constructMotherLattice2Dfor1DChain(fibo_lattice)

syms x
phi=solve(x^2 - x - 1 == 0, x);
phi_plus = phi(2);

theta = atan(1/phi_plus); 
% (xi,yi) are the 2D coordinates of the Mother_Lattice
% (xi) are the 1D coordinates of fibo_lattice
% NOTE that the x-coord of the 1D and the 2D (Mother_Lattice) are the same

THETA = (1+fibo_lattice)/2; 
KAPPA = -fibo_lattice;
KAPPA(find(fibo_lattice==1)) = -fibo_lattice(find(fibo_lattice==1))./phi_plus; 

Mother_Lattice(1,1) = 0 - KAPPA(1)*fibo_lattice(1); 
Mother_Lattice(2,1) = 0 - fibo_lattice(1)*sin( THETA(1)*(pi/2) + theta );

for i=2:length(fibo_lattice)
    Mother_Lattice(1,i) = Mother_Lattice(1,i-1) - KAPPA(i)*fibo_lattice(i); 
    Mother_Lattice(2,i) = Mother_Lattice(2,i-1) - fibo_lattice(i)*sin( THETA(i)*(pi/2) + theta );
end







