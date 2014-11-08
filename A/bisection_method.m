while 1
    clear all;
    clc;
    msg={'Enter lower Guess :','Enter higher Guess :'};
    dtext={'',''};
    title='Input For The Function y=cos(x)';
    userinput=inputdlg(msg,title,1,dtext);
    if(size(userinput,2) == 0) , disp('good bye'),break;
    end
    xl=str2double(userinput{1});
    xu=str2double(userinput{2});
    iter=0;
    while 1
        xr = (xl+xu) / 2;
        fxl = cos(xl);
        fxr = cos(xr);
        if(abs(fxr) < 0.0001), break;
        elseif((fxl * fxr) < 0) 
            xu = xr;
        else
            xl = xr;
        end;
        %disp(xr);
        iter = iter+1;
    end;

    %fprintf('Value is %f\n',cos(xr));
    %fprintf('Resutl is:%f\n', xr);
    tmpstr=sprintf('Result is: %f\nTaken Iteration: %d',xr,iter);
    mbox=msgbox(tmpstr,'Result');
    uiwait(mbox);
end;