clear all;

fx = [400 -900 675 -200 25 0.2];

a = 0;
b = 0.8;
h =  b - a;
trap = h * (polyval(fx, a) + polyval(fx, b))/2;
disp(trap);