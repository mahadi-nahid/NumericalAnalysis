% Ok... For polynomial.....

% MDMAHADI HASAN NAHID
% 01-12-2012, 4:40PM

function BisectionMethodForPolynomial()
    
while 1
    clear all;
    clc;
    msg={'Enter lower Guess :','Enter higher Guess :','ERROR'};
    dtext={'','','0.00001'};
    title='Input For Any Function';
    userinput=inputdlg(msg,title,3,dtext);
    if(size(userinput,2) == 0) , disp('good bye'),break;
    end;
    xl=str2double(userinput{1});
    xu=str2double(userinput{2});
    error=str2double(userinput{3});
    
    fun = [1 0 -9];
    roots(fun)
    iter=0;
    success = 0;
    while iter < 10000
        
        xr = (xl+xu) / 2;
        fxl = polyval(fun,xl);
        %fprintf('fxl %d\n', xl);
        %disp(fxl);
        fxr = polyval(fun,xr);
        %disp(fxr);
        
        if(abs(fxr) < error),success=1; break;
        elseif((fxl * fxr) < 0) 
            xu = xr;
        else
            xl = xr;
        end;
        
        %disp(xr);
        iter = iter+1;
    end;
    if success
        tmpstr=sprintf('Result is: %f\nTaken Iteration: %d',xr,iter);
        mbox=msgbox(tmpstr,'Result');
        uiwait(mbox);
    else 
        mbox=msgbox('Maximum iteration Over ! Gauss Again');
        uiwait(mbox);
    end
end;
