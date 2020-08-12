function [res] = adapTrap( func, a, b, tol, fa, fb )
% [I2,points] = adaptrap( f, a, b, tol )
% Function che approssima l’integrale definito da func(x) con estremi a, b 
% mediante la formula di Trapezi adattiva.
% Input:
%       f= Funzione Integranda
%       a,b= estremi di integrazione
%       tol= Accuratezza risultati
global points
delta = 0.5; % ampiezza minima intervalli
if nargin<=4
    fa = feval( func, a );
    fb = feval( func, b );
    if nargout==2
        points = [a fa; b fb];
    else
        points = [];
    end
end
h = b-a;
x1 = (a+b)/2;
f1 = feval( func, x1 );
if ~isempty(points)
    points = [points; [x1 f1]];
end
I1 = .5*h*( fa+fb );
I2 = .5*( I1 + h*f1 );
e = abs( I2-I1 )/3;
if e>tol || abs(b-a)>delta
    I2 = adapTrap( func, a, x1, tol/2, fa, f1 ) + adapTrap( func, x1, b, tol/2, f1, fb );
end

res= [I2 points];
return
end
