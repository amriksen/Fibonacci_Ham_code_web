%% Fibonacci number by Recursion
function f = fibnum(n)
    if n <= 1
        f = 1;
    else
        f = fibnum(n-1) + fibnum(n-2);
    end