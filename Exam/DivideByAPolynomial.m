%-------------PROBLEM-------------
% MD MAHADI HASAN NAHID
% 30-11-2012, 9:25PM


clear all;
clc;

a = [1 2 -24]; % Fist Polynomial
b = [1 -4];        % Second Polynomial

n = 3;
m = 2;

for j = 1:n

    r(j) = a(j);
    q(j) = 0;

end

for k = n-m:1:-1
   
    q(k+1) = r(m+k)/d(m);
    
    for j = m+k-1:k:-1
       
        r(j) = r(j) - q(k+1) * b(j-k);
        
    end
    
end

for j = m:n
   
    r(j) = 0;
    
end

n = n - m;

for i = 1 : n
   
    a(i) = q(i+1);
    
end
a