function FibWordN = Fibonacci_Word_length_FibN(N)

%This function outputs an array comprising of a Fibonacci word of length 
%F_{N}


%S = zeros(1,N);
S_past = [0 1];
S_past_past = 0;
S_present = [];
if N > 2
    while length(S_present) < fibnum(N)
        S_present = [S_past S_past_past]; 
        S_past_past = S_past; 
        S_past = S_present;  
    end
elseif N == 1
    S_present = 0; 
elseif N==2
    S_present = [0 1]; 
end
    
FibWordN = S_present; 
