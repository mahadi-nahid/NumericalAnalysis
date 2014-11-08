%------------------OK-----------------

% Polynomial Deflation
% MD MAHADI HASAN NAHID
% 30-11-2012, 9:25PM

clear all;
clc;

fx = [1 -7 -3 79 -46 -120];

t = -3; % Devide by (x-4)

n = 6; % Order of the Polynomial + 1 // The size(Number of elements) of the array


r = fx(1); % Assigning the first element

fx(1) = 0; % Coeficient of the highest order = 0//if devide by x the x^n => x^(n-1)

for i = 2 : n % loop from the second element to the last element
    
    s = fx(i);
    fx(i) = r;
    r = s + r*t;
    
    %disp(fx(i));
    
end

disp(sprintf('The Polynomial after dividing by %d', t)); % to dispaly...// 
                                                         % sprintf => same
                                                         % as printf in c//
disp(fx);



