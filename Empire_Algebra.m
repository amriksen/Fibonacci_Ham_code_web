clear all; 
O = [1 0; 0 -1]; % sigma_z = sigma_3 = O
L = [0 -i; i 0]; % sigma_y = sigma_2 = -1
S = [0 1; 1 0]; % sigma_x = sigma_1 = 1
%1=LL, 2=LS, 3=SL
% An empire of LL of a given perfect fibonacci chain
% E^1  = OLSLLSLO
% E^3  = OLOOLSLO 

% OL = kron(O,L);
% OLS = kron(OL,S); OLO = kron(OL,O);
% OLSL = kron(OLS,L); OLOO = kron(OLO,O);
% OLSLL = kron(OLSL,L); OLOOL = kron(OLOO,L);
% OLSLLS = kron(OLSLL,S); OLOOLS = kron(OLOOL,S);
% OLSLLSL = kron(OLSLLS,L); OLOOLSL = kron(OLOOLS,L);
% OLSLLSLO = kron(OLSLLSL,O); OLOOLSLO = kron(OLOOLSL,O);
% E1 = OLSLLSLO;
% E3 = OLOOLSLO;
% com_E1E3 = E1*E3 - E3*E1; % commutes, determinant of com_E1E3 = 0; 

% An empire of LL of a random chain
% E^1  = LSLLOOOO
% E^3  = OOOOLSLO 
% 
% LS = kron(L,S); OO = kron(O,O);
% LSL = kron(LS,L); OOO = kron(OO,O);
% LSLL = kron(LSL,L); OOOO = kron(OOO,O);
% LSLLO = kron(LSLL,O); OOOOL = kron(OOOO,L);
% LSLLOO = kron(LSLLO,O); OOOOLS = kron(OOOOL,S);
% LSLLOOO = kron(LSLLOO,O); OOOOLSL = kron(OOOOLS,L);
% LSLLOOOO = kron(LSLLOOO,O); OOOOLSLO = kron(OOOOLSL,O);
% 
% E1 = LSLLOOOO; E3 = OOOOLSLO; 
% com_E1E3 = E1*E3 - E3*E1; % does not commute, determinant of com_E1E3 non-zero

%% constructing for a perfect fibonacci chain
fibN =7; vc=1; random_coordinate=5;
%fib_lattice = [-1 1 -1 -1  1  -1  1 -1 -1 1 -1  -1  1 -1 1 -1 -1 1 -1 1 -1];
fib_lattice = [1  -1  1 -1 -1 1 -1  -1  1 -1 1];
%Mfib = SLSLLSLLSLS
oldEmp_Vec = Enlist_empire1D_CutProj(fib_lattice, vc, random_coordinate,fibN);
%E^1 = SLSLLSLOOLS

SL = kron(S,L);
SLS = kron(SL,S);
SLSL = kron(SLS,L);
SLSLL = kron(SLSL,L);
SLSLLS = kron(SLSLL,S);
SLSLLSL = kron(SLSLLS,L);
SLSLLSLO = kron(SLSLLSL,O);
SLSLLSLOO = kron(SLSLLSLO,O);
SLSLLSLOOL = kron(SLSLLSLOO,L);
SLSLLSLOOLS = kron(SLSLLSLOOL,S);
E1_5 = SLSLLSLOOLS; 

% vc = 3; random_coordinate = 7; 
% oldEmp_Vec2 = Enlist_empire1D_CutProj(fib_lattice, vc, random_coordinate,fibN);
% 
% %E^3 = SLOOLSLOOLO
% SLO = kron(SL,O); 
% SLOO = kron(SLO,O);
% SLOOL = kron(SLOO,L);
% SLOOLS = kron(SLOOL,S);
% SLOOLSL = kron(SLOOLS,L);
% SLOOLSLO = kron(SLOOLSL,O);
% SLOOLSLOO = kron(SLOOLSLO,O);
% SLOOLSLOOL = kron(SLOOLSLOO,L);
% SLOOLSLOOLO = kron(SLOOLSLOOL,O);
% E3_7 = SLOOLSLOOLO; 
% 
% com_E1_5E3_7 = E1_5*E3_7 - E3_7*E1_5;

vc = 3; random_coordinate = 7; 
oldEmp_Vec3 = Enlist_empire1D_CutProj(fib_lattice, vc, random_coordinate,fibN);
%1    -1     0     0    -1     1    -1     0     0    -1     0
%E3 = SLOOLSLOOLO
SL = kron(S,L);
SLO = kron(SL,O); 
SLOO = kron(SLO,O);
SLOOL = kron(SLOO,L);
SLOOLS = kron(SLOOL,S);
SLOOLSL = kron(SLOOLS,L);
SLOOLSLO = kron(SLOOLSL,O);
SLOOLSLOO = kron(SLOOLSLO,O);
SLOOLSLOOL = kron(SLOOLSLOO,L);
SLOOLSLOOLO = kron(SLOOLSLOOL,O);
E3_7 = SLOOLSLOOLO;

com_E1_5E3_7 = E1_5*E3_7 - E3_7*E1_5;

%Mfib = SLSLLSLLSLS
SLSLLSLL = kron(SLSLLSL,L);
SLSLLSLLS = kron(SLSLLSLL,S);
SLSLLSLLSL = kron(SLSLLSLLS,L);
SLSLLSLLSLS = kron(SLSLLSLLSL,S);
Mfib = SLSLLSLLSLS; 
[E_Mfib,e_Mfib] = eig(Mfib); % evs of M(fib_lattice) = +/- 1





