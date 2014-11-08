% ------------PROBLEM----------------%

% Polynomial Deflation
% MD MAHADI HASAN NAHID
% 30-11-2012, 9:25PM

clear all;
clc;

fx = [-120 -46 79 -3 -7 1];

t = -3; % Devide by (x-4)

n = 6; % Order of the Polynomial + 1 // The size(Number of elements) of the array


r = fx(n); % Assigning the first element

fx(n) = 0; % Coeficient of the highest order = 0 // if devide by x the x^n => x^(n-1)

for i = n : 1: -1 % loop from the second element to the last element
    
    s = fx(i);
    fx(i) = r;
    r = s + r*t;
    
    %disp(fx(i));
    
end

disp(sprintf('The Polynomial after dividing by %d', t)); % to dispaly...// 
                                                         % sprintf => same
                                                         % as printf in c//
disp(fx);



