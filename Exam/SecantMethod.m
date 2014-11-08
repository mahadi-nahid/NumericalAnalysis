function SecantMethod()

clear all;
clc;
while 1
    
    msg = {'Enter Your Function : ', 'Enter First Guess: ', 'Enter Second Guess: ', 'Error: ', 'How many Iteration: '};
    title = 'Input For Any Function';
    dtext = {'x^2-25','2', '4', '0.00001', '50'};
    userinput = inputdlg(msg, title, 3, dtext);
    
    if (size(userinput,2) == 0), disp('Good Bye'), break;
    end;
    
    syms x y x0 x1 fxi fx0 ;
    
     
    y = userinput{1};
    x0 = str2double(userinput{2});
    x1 = str2double(userinput{3});
    error = str2double(userinput{4});
    iter = str2double(userinput{5});
    
    older = x0;   
    old = x1;
    
    folder = subs(y,x,older);

   
    i =0;
    success = 0;
    
    while i < iter
        
        fold = subs(y,x,old);
        dx = fold * ( old - older ) / ( fold - folder );
        new = old - dx;

        
        fprintf ( '\t\t %3d \t %.15f \n', i, new );
       

        if ( abs(dx) < error ) 
           success = 1;
           break;
        else
           older = old;
           old = new;
           folder = fold;
        end
        
        i = i+1;
        
    end;
    
    if success
        fprintf('The root is : %f\n', new);
        tmpstr=sprintf('Result is: %f\nTaken Iteration: %d',new,i);
        mbox=msgbox(tmpstr,'Result');
        uiwait(mbox);
    else
        fprintf('Not Found\n');
    end;
    
   

end;

