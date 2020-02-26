function defect_cnt = countDefectsFibChain(newfib_lattice)

% there are 2 types of defects that we will count, viz. SS and LLL
defect_cnt = 0; 

for n=2:length(newfib_lattice)
   if newfib_lattice(n) == 1 && newfib_lattice(n-1) == 1
       defect_cnt = defect_cnt + 1; 
   elseif (n>=3 && newfib_lattice(n) == -1 && newfib_lattice(n-1) == -1 ...
           && newfib_lattice(n-2) == -1) 
       defect_cnt = defect_cnt + 1; 
   end
   %% Correct the following--
%    if (n>=9 && newfib_lattice(n-2:n) == newfib_lattice(n-5:n-3) ...
%           && newfib_lattice(n-5:n-3) == newfib_lattice(n-8:n-6))
%        defect_cnt = defect_cnt + 1;
%    end
end