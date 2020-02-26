function newVC = flipVC(oldVC); 

randVC = randi([1,3],1,1); 
if randVC == oldVC
    offset = randi([1,2],1,1);
    randVC = mod(randVC+offset,3);
%     if randVC == 0
%         randVC = 3; 
%     else
%         randVC = randVC; 
%     end
else
    randVC  = randVC; 
end
newVC = randVC; 
if newVC == oldVC, error('DID NOT FLIP ANYTHING'); end
