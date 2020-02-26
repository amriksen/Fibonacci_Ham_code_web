# Fibonacci_Ham_code_web
Matlab code: Hamiltonian Monte Carlo simulation of Fibonacci quasicrystal model 
Copyright: Amrik Sen, Thapar Institute, Punjab, India
Version: January 2020 (runs on Matlab2017a, Matlab2018a)
Email: amriksen@thapar.edu
	amriksen@gmail.com
==============================================================
Following are the list of functions/driver scripts for running the 1D Fibonacci simulation

1) Hamiltonian_Phason_Dynamo.m (driver script to start the simulations)
    Dependencies: none (the script runs automatically upon execution, parameters are listed at the top of the script)

	i) Detect_VC.m (detects the type of VC at a given location)
	ii) Enlist_empire1D_CutProj.m (constructs the empire for an chain configuration using geometric method)
	iii) singleFlipMonteCarloStep1D.m (computes the new chain configuration based on the Metropolis algorithm)
	iv) countDefectsFibChain.m (maintains log of the number of illegal states in a chain, e.g.. LLL, SS)
	v) constructMotherLattice2Dfor1DChain.m (constructs the 2D lattice from which the projection is done to construct the empire)


Following are the scripts to perform the spectral analysis of the Hamiltonian matrix

2) HamMatConstructor.m (constructs the Hamiltonian matrix eq. (14) of Sen and Perelman, 2020 paper, performs spectral analysis by computing the eigenvalue-eigenvector decomposition)



 
    
