function [l1,x1]=metodoPotenze(M, tol, itmax)
% Function che implementa il metodo delle potenze per calcolare
% l’autovalore dominante e il corrispettivo autovettore
% Input:
%       M= matrice
%       tol= tolleranza
%       itmax= numero massimo di iterazioni
[m,n]= size(M);
if m~=n, error('La matrice non è quadrata!'), end
if nargin<=2
    if nargin<=1
        tol= 1e-6;
    else
        if tol>=0.1 || tol<=0, error( 'Tolleranza non valida'), end
    end
    itmax= ceil(-log10(tol))*n;
end
x= rand(n,1);
l1= 0;
for k=1:itmax
    x1= x/norm(x);
    x= M*x1;
    l0= l1;
    l1= x'*x1;
    err= abs(l1-l0);
    if err<=tol*(1+ abs(l1)), break, end
end
    if err>tol *(1+abs(l1)), error('Convergenza non raggiunta'), end
    
return