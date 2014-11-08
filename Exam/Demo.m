clear all;
clc;

A = [1 2 3;
    3.2 -2 -10;
    1 -2 3];
[L] = lu(A);


L



for i=0:10
    
    if rem(i,2) == 0
        fprintf('i = %d(Even)\n', i);
    else
        fprintf('\ni = %d(Odd)\n', i);
    end;
    
end;
fprintf('\n\n--------------Fuck You!!---------------\n');

i = 0;
while i <100
    if (i == 10), fprintf('break-----------------------------\n'); break;
    end;
     i = i+1;   
end