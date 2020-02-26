function empire_Vector = Enlist_empire(fibo_lattice, VC, rand_coord,fibN)

syms x
phi=solve(x^2 - x - 1 == 0, x);
% This version has  phi(1) = 1/2 - 5^(1/2)/2  phi(2) = 5^(1/2)/2 + 1/2
% Other versions may have phi(1) = 5^(1/2)/2 + 1/2  phi(2) =  1/2 - 5^(1/2)/2
% we need phi = 5^(1/2)/2 + 1/2

thePHI = phi(2); 

if rand_coord <= ceil((length(fibo_lattice))/2)
    right = 1; % the longest tail on either side of rand_coord is on the right
else
    right = 0; % the longest tail on either side of rand_coord is on the left
end
  
j=rand_coord; N=length(fibo_lattice); 
fibword =Fibonacci_Word_length_FibN(fibN);
fibword = [1 fibword];
EV_right = []; EV_left = [];
if VC == 1 % START calculating empires of LL
    EV_VC_right = -1;
    EV_VC_left = -1; 
    if right == 1 
        for l=j+1:N % computing right entries
            n=l-j; 
            fn = fibword(n+1); 
            fnplus1 = fibword(n+1+1); 
            fnminus1 = fibword(n-1+1);% +1 is added bc f(0) is f(1) in Matlab 
            EV_right(n) = fnplus1*(fn + fnminus1)-fn; 
        end % end of for l=j+1:N
        for l=j-2:-1:1 
            m = abs(l-j+1);
            EV_left(m) = EV_right(m); 
        end % end of for l=j-2:-1:1
    else % right == 0
        n = 1; 
        for l=j-2:-1:1 
            m = abs(l-j+1); 
            fn = fibword(n+1); 
            fnplus1 = fibword(n+1+1); 
            fnminus1 = fibword(n-1+1);
            EV_left(m) = fnplus1*(fn + fnminus1)-fn;
            n=n+1; 
        end % end of for l=j-2:-1:1
        ll = j-2; m = abs(ll-j+1);
        for l=j+1:N
            n=l-j;  
            EV_right(n) = EV_left(m); 
            m=m+1; 
        end
    end
    EV_left = flip(EV_left);
    % END calculating empires of LL
elseif VC == 2 % START calculating empires of LS
    EV_VC_right = 1;
    EV_VC_left = -1;
    if right == 1 
       EV_right(1) = -1;
       for l=j+2:N
           n=l-j;
           EV_right(n) = 3 + floor((n-1)*thePHI) - floor((n+1)*thePHI); 
       end % end of for l=j+2:N
       for l=j-2:-1:1
           m = abs(l-j+1);
           EV_left(m) = 3 + floor(m*thePHI) - floor((m+2)*thePHI);
       end % end of for l=j-2:-1:1
    else %right == 0, fill EV_left as EV_right for SL and fill EV_right as EV_left for SL
        for l=j-2:-1:1 
            m = abs(l-j+1);
            EV_left(m) = 3 + floor(m*thePHI) - floor((m+2)*thePHI);
        end % end of for l=j-2:-1:1 
        EV_right(1) = -1;
        for l=j+2:N
            n=l-j;  
            EV_right(n) = 3 + floor((n-1)*thePHI) - floor((n+1)*thePHI); 
        end
    end
    EV_left = flip(EV_left);
    % END calculating empires of LS
elseif VC == 3 % START calculating empires of SL
    EV_VC_right = -1;
    EV_VC_left = 1;
    if right == 1 
       for l=j+1:N
           n=l-j;
           EV_right(n) = 3 + floor(n*thePHI) - floor((n+2)*thePHI); 
       end % end of for l=j+2:N
       EV_left(1) = -1;
       for l=j-3:-1:1
           m = abs(l-j+1);
           EV_left(m) = 3 + floor((m-1)*thePHI) - floor((m+1)*thePHI);
       end % end of for l=j-2:-1:1
    else %right == 0, fill EV_left as EV_right for LS and fill EV_right as EV_left for LS
        EV_left(1) = -1;
        for l=j-3:-1:1 
            m = abs(l-j+1);
            EV_left(m) = 3 + floor((m-1)*thePHI) - floor((m+1)*thePHI);
        end % end of for l=j-3:-1:1 
        for l=j+1:N
            n=l-j;  
            EV_right(n) = 3 + floor(n*thePHI) - floor((n+2)*thePHI); 
        end % end of for l=j+2:N
    end
    EV_left = flip(EV_left);
    % END calculating empires of SL
elseif VC == 0 % SS defect
    EV_VC_left = [];% keep the empire empty (for now, rethink later)
    EV_VC_right = []; 
end
empire_Vector = [EV_left EV_VC_left EV_VC_right EV_right];