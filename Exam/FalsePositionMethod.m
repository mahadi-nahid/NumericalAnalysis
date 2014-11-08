
% MDMAHADI HASAN NAHID
% 01-12-2012, 4:35PM

function FalsePositionMethod()
    
while 1
    clear all;
    clc;
    msg={'Enter lower Guess :','Enter higher Guess :','ERROR'};
    dtext={'','','0.00001'};
    title='Input For Any Function';
    userinput=inputdlg(msg,title,2,dtext);
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
        
        fxl = polyval(fun,xl);
        fxu = polyval(fun,xu);
        
        divide = (fxl-fxu);
        
        if(abs(divide) <= 0.0000000001) ,success=0;fail=msgbox('Choose Another Guess !');uiwait(fail),break; 
        end
        xr = xu-(fxu*(xl-xu)) / divide;
         
        fxr = polyval(fun,xr);   
        
        if(abs(fxr) < error),success=1; break;
        elseif((fxl * fxr) < 0) 
            xu = xr;
        else
            xl = xr;
        end;
        
       % disp(xr);
        iter = iter+1;
    end;
    if success
        tmpstr=sprintf('Result is: %f\nTaken Iteration: %d',xr,iter);
        fprintf('result %f\n', xr );
        mbox=msgbox(tmpstr,'Result');
        uiwait(mbox);
    else 
        mbox=msgbox('Maximum iteration Over ! Gauss Again');
        uiwait(mbox);
    end
end;
