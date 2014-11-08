clear all;
clc;

while 1;
    n=10;
    [x,y]=ginput(n);
    temp=inputdlg('Value of X: ');
    px=str2double(temp{1});
    if(px == -1)
        break;
    end;
    a1=(n*sum(x.*y) - sum(x)*sum(y))/(n*sum(x) - sum(x)^2);
    a0=mean(y) - a1*mean(x);
    ans = a0 + a1*px;
    disp(ans);
end