
%MD MAHADI HASAN NAHID
% LU DECOMPOSITION
%----------------------------------

function [L, U] = LUDecom(A,n)


% A = [3 -0.1 -0.2;0.1 7 -0.3;0.3 -0.2 10];
% n = 3;
% B = [7.8 -19.3 71.4];

L = eye(n);

for k = 1:n-1
    
    for i = k+1:n
        factor = A(i,k)/A(k,k);
       % A(i,k) = factor;
        A(i,k) = 0;
        L(i,k) = factor;
        
        for j = k+1:n
            A(i,j) = A(i,j) - factor*A(k,j);
        end;
    end;
end;

U = A;

end


