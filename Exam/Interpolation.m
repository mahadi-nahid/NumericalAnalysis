function interpollution()
clear all;
clc;
while 1
    n=2;
    temp = inputdlg('function : ');
    fun = temp{1};
    temp = inputdlg('value of x0 : ');
    x0 = str2double(temp{1});
    temp = inputdlg('value of x1 :');
    x1= str2double(temp{1});
    temp = inputdlg('value of x : ');
    x = str2double(temp{1});
    ans = log(x0)+((log(x1)-log(x0))/(x1 - x0))*(x - x0);
    disp('ANS : ');
    disp(ans);
end
end

function r = f(fun,x)
r = 25;
end