
%MD MAHADI HASAN NAHID
%OK ...FINALLY..... :)

function NewtonRaphson()

clear all;
clc;

while 1
    
    msg={'Your Function:','Enter Initial Guess :','ERROR', 'Number of Iteration: '};
    dtext={'x^2-9','2','0.00001',''};
    title='Input For Any Function';
    userinput=inputdlg(msg,title,3,dtext);
    if(size(userinput,2) == 0) , disp('good bye'),break;
    end;
    
    syms x y d x0 e;
    
    y = userinput{1};
    %disp(y);
    d = diff(y,'x');
    %disp(d);
    x0 = str2double(userinput{2});
    %disp(x0);
    
    error = str2double(userinput{3});
    %disp(error);
    iter = str2double(userinput{4});
    i = 0;
    success = 0;
    while i < iter
        fprintf('------------%d\n', i);
        
        fxi = subs(y,x,x0);
        fprintf('fxi ==== %d\n', fxi);
    
        dfxi = subs(d,x,x0);
        fprintf('dfxi ==== %d\n', dfxi);
  
        if abs(dfxi) < 0.00001
            success = 0;
            m = sprintf('Chose another guess\nIts derivative at this point is closed to 0');
            msg = msgbox(m,'Error');
            uiwait(msg);
            break;
        end;
        a = x0 - (fxi/dfxi);        
        fprintf('a ==== %d\n', a);
        
        e = ((a - x0)/a) * 100;
        fprintf('e ==== %d\n', e);
        
        if abs(e) < error
            success = 1;
            break;
        end;
        
        x0 = a;
        
        i = i+1;
        
       % fprintf('-------end-----\n');
    end;
    
    if success
        fprintf('The root is : %f\n', a);
        tmpstr=sprintf('Result is: %f\nTaken Iteration: %d',a,i);
        mbox=msgbox(tmpstr,'Result');
        uiwait(mbox);
    else
        fprintf('Not Found\n');
    end;
    
end;









