function muller_multiple()
    clear all;clc;
    xr=5;h=0.5;eps=0.00001;maxit=1000;
    x2=xr;
    x1=xr+h*xr;
    x0=xr-h*xr;
    
    f = [1 0 -13 -12];
    result_no=length(f);
    while result_no > 1
        iter = 0;
        x2=xr;
        x1=xr+h*xr;
        x0=xr-h*xr;
        
        while 1
            iter=iter+1;
            h0=x1-x0;
            h1=x2-x1;
            fx1=polyval(f,x1);fx0=polyval(f,x0);fx2=polyval(f,x2);
            d0=(fx1-fx0)/h0;
            d1=(fx2-fx1)/h1;
            a=(d1-d0)/(h1+h0);
            b=a*h1+d1;
            c=fx2;

            red=sqrt(b*b-4*a*c);
            if abs(b+red) > abs(b-red)
                den=b+red;
            else
                den=b-red;
            end

            dxr=-(2*c)/den;
            xr=x2+dxr;

            %[iter xr]

            if abs(dxr) < eps || iter >= maxit
                break;
            end

            x0=x1;x1=x2;x2=xr;
        end
        disp('root:');
        disp(x2);
        [f test]=pdeflation(f,x2);
        result_no = result_no-1;
    end
end