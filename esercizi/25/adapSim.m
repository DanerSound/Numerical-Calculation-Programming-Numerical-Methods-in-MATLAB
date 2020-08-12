function [I2,points] = adapSim( func, a, b, tol, fa, f1, fb )
% [I2,points] = adapsim( f, a, b, tol )
% Function che approssima l’integrale definito da func(x) con estremi a, b 
% mediante la formula di Simpson adattiva.
% Input:
%       f= Funzione Integranda
%       a,b= estremi di integrazione
%       tol= Accuratezza risultati
global points
delta = 0.5; % ampiezza minima intervalli
x1 = (a+b)/2;
if nargin<=4
    fa = feval( func, a );
    fb = feval( func, b );
    f1 = feval( func, x1 );
    if nargout==2
        points = [a fa;x1 f1; b fb];
    else
        points = [];
    end
end
h = (b-a)/6;
x2 = (a+x1)/2;
x3 = (x1+b)/2;
f2 = feval( func, x2 );
f3 = feval( func, x3 );
if ~isempty(points)
    points = [points; [x2 f2; x3 f3]];
end
I1 = h*( fa+4*f1+fb );
I2 = .5*h*( fa + 4*f2 + 2*f1 + 4*f3 +fb );
e = abs( I2-I1 )/15;
if e>tol || abs(b-a)>delta
    I2 = adapSim( func, a, x1, tol/2, fa, f2, f1 ) + adapSim( func, x1, b, tol/2, f1, f3, fb );
end
return
end

