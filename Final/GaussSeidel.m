% OK....
% Md MAHADI HASAN NAHID
%-----------------------------

clear all;
clc;

A = [3 -0.1 -0.2;
    0.1 7 -0.3;
    0.3 -0.2 10];

B = [7.85 -19.3 71.4];
X = [0 0 0];
n = 3;

lambda = 1.1;


for i = 1: n;
    
    dummy = A(i,i);
    
    for j = 1:n
        A(i,j) = A(i,j)/dummy;
    end;
    B(i) = B(i) / dummy;
    
end;

for i = 1:n
    sum = B(i);
    
    for j = 1:n
        if i ~= j
            sum = sum - A(i,j)*X(j);
        end;
    end;
    
    X(i) = sum;
end;

iter = 1;

while iter < 250
    
    sentinel = 1;
    
    for i = 1:n
        old = X(i);
        sum = B(i);
        
        for j = 1:n
            if i~=j 
                sum = sum - A(i,j)*X(j);
            end;
        end;
        X(i) = lambda*sum +(1.0-lambda)*old;
        
        if sentinel == 1&&X(i) ~= 0
            ea = abs((X(i)-old)/X(i))*100;
            if ea > 0.0005
                sentinel = 0;
            end;
        end;           
    end;
    
    iter = iter + 1;
    
    if sentinel == 1 || (iter >= 150) 
        break;
    end;
    
end;

X