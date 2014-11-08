function modfalseposition()
    
while 1
    clear all;
    clc;
    success=1;
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
    iu=0;
    il=0;
    while 1
        fxl = fun_value(fun,xl);
        fxu = fun_value(fun,xu);
        if il >= 2
            fxl = fxl/2;
        elseif iu >=2
            fxu = fxu/2;
        end
        divide = (fxl-fxu);
        if(abs(divide) <= 0.0000000001) ,success=0;fail=msgbox('Choose Another Guess !');uiwait(fail),break; 
        end
        xr = xu-(fxu*(xl-xu)) / divide;
        fxr = fun_value(fun,xr);
        if(abs(fxr) < error), break;
        elseif((fxl * fxr) < 0) 
            xu = xr;
            iu = 0;
            il = il+1;
        else
            xl = xr;
            il=0;
            iu = iu+1;
        end;
        %disp(xr);
        iter = iter+1;
    end;
    if(success)
        tmpstr=sprintf('Result is: %f\nTaken Iteration: %d',xr,iter);
        mbox=msgbox(tmpstr,'Result');
        uiwait(mbox);
    end
end;

function value = fun_value(fun,x)
value=eval(fun,x);
