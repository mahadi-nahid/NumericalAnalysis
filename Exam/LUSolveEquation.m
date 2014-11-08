clear all;
clc;

A = [3 -0.1 -0.2;0.1 7 -0.3;0.3 -0.2 10];
B = [7.8 -19.3 71.4];

n = 3;
%X = [0 0 0];

%Forward substitution

for i = 2:n
    
    sum = B(i);
    
    for j = 1:i-1
        sum = sum - A(i,j)*B(j);
    end;
    
    B(i) = sum;
end;

X(n) = B(n)/A(n,n);

for i = n-1:-1:1

    sum = 0;
    for j = i+1:n
        sum = sum + A(i,j)*X(j);
    end;
    
    X(i) = (B(i) -sum)/A(i,i);
end;

X

