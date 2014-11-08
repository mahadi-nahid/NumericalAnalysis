function brent_method()
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
    eps = 2.220446492531E-16;
    tol = 0.000001;
    a=xl;b=xu; fa=f(a);fb=f(b);
    c=a;fc=fa;d=b-c;e=d;
    do
       IF fb = 0 EXIT
       IF fa > fb THEN
        a=c;fa=fc;d=b-c;e=d;
       ENDIF
       IF |fa| < |fb| THEN
        c=b;b=a;a=c;
        fc=fb;fb=fa;fa=fc;
       ENDIF
       m=0.5 * (a-b)
       tol = 2*eps*max(abs(b),1);
       IF |m| <= tol Or fb=0. THEN
        EXIT;
       ENDIF
        IF |e| >= tol And |fc| > |fb| THEN
            s=fb/fc;
            IF a=c THEN
                p=2*m*s;
                q=1-s;
            ELSE
                q=fc/fa;r=fb/fa;
                p=s*(2*m*q*(q-r)-(b-c)*(r-1));
                q=(q-1)*(r-1)*(s-1);
            ENDIF
                IF p>0 THEN q=-q ELSE p=-p;
                IF 2*p < 3*m*q - |tol*q| AND p < |0.5*e*q| THEN
                    e=d;d=p/q;
                 ELSE
                    d=m;e=m;
                   ENDIF
             ELSE
                d=m;e=m;
             ENDIF
                c=b;fc=fb;
                IF |d| > tol THEN b=b+d ELSE b=b-Sgn(b-a)*tol;
                fb=f(b);
             ENDDD
            disp(b);
       
end;

function value = f(fun,x)
value=eval(fun,x);