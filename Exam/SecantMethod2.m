
function y = SecantMethod2 ( f, x0, x1, TOL, Nmax )

%SECANT        approximate the root of an arbitrary function using the
%              Secant method
%
%     calling sequences:
%             y = secant ( 'f', x0, x1, TOL, Nmax )
%             secant ( 'f', x0, x1, TOL, Nmax )
%
%     inputs:
%             f       string containing name of m-file defining function
%                     whose root is to be located
%             x0,x1   initial approximations to location of root
%             TOL     absolute error convergence tolerance
%             NMax    maximum number of iterations to be performed
%
%     output:
%             y       approximate value of root
%
%     NOTE:
%             if SECANT is called with no output arguments, the 
%             iteration number and the current approximation to the 
%             root are displayed
%
%             if the maximum number of iterations is exceeded, a message
%             to this effect will be displayed and the most recent
%             approximation will be returned in the output value
%

older = x0;   old = x1;
folder = feval(f,older);

for i = 2 : Nmax
    fold = feval(f,old);
	dx = fold * ( old - older ) / ( fold - folder );
    new = old - dx;
	
	if ( nargout == 0 )
	   fprintf ( '\t\t %3d \t %.15f \n', i, new );
	end
	
	if ( abs(dx) < TOL ) 
	   if ( nargout == 1 )
	      y = new;
	   end
	   return
	else
	   older = old;
	   old = new;
	   folder = fold;
	end
	
end

disp('Maximum number of iterations exceeded')
if ( nargout == 1 ) y = new; end