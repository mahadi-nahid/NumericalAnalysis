clear all;

fx = [400 -900 675 -200 25 0.2];

a = 0;
b= 0.8;
n = 250;
h = (b- a)/ n;

sum = polyval(fx, a);

for i = 1 :1: n-1
    sum = sum + 2 * polyval(fx, a+(i*h));
end;

sum =  sum + polyval(fx, b);

trapm = h * (sum / 2);

disp(trapm);