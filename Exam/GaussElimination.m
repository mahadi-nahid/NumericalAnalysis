function GaussElimination()
clear all;
clc;


a = [3 2;
    -1 2];

b = [18 2 ];
n = 2; %dimention of the matrix (must be square)


for k = 1:n-1
    for i = k+1:n
        factor = a(i,k)/a(k,k);
        for j = k:n
            a(i,j) = a(i,j) - factor*a(k,j);
        end;
        b(i) = b(i) - factor*b(k);
    end;
end;

fprintf('After Eliminating ... a: \n');
disp(a);
fprintf('----------------- ... b: \n');
disp(b);

x(n) = b(n) /a(n,n);
disp(x(n));
fprintf('----------------------------- \n');

for i=n-1:-1:1
    sum = b(i);
    for j = i+1:n
        sum = sum - a(i,j)*x(j);
    end;
    x(i) = sum/a(i,i);
end;

disp(x);