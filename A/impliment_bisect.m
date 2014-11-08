function impliment_bisect()
    
while 1
    clear all;
    clc;
    msg={'Your Function :','Enter lower Guess :','Enter higher Guess :','ERROR'};
    dtext={'','','','0.00001'};
    title='Input For Any Function';
    userinput=inputdlg(msg,title,1,dtext);
    if(size(userinput,2) == 0) , disp('good bye'),break;
    end;
    xl=str2double(userinput{2});
    xu=str2double(userinput{3});
    error=str2double(userinput{4});
    fun=userinput{1};
    iter=0;
    success = 0;
    while iter < 1000
        xr = (xl+xu) / 2;
        fxl = fun_value(fun,xl);
        fxr = fun_value(fun,xr);
        if(abs(fxr) < error),success=1, break;
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

function value = fun_value(fun,x)
value=feval(@eval,fun,x);