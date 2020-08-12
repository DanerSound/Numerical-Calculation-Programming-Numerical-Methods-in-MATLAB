function [x]=splitting(A, Msolve, b, tol)
% Function che risolve il sistema lineare Ax=b tramite un generico splitting,
% che viene passato dal parametro Msolve.
% Input:
%       b= vettore colonna dei termini noti
%       A= Matrice
%       Msolve= funzione di Jacobi o di GaussSeidel
%       tol= tolleranza
[n,m]= size(A);
if(n~= m || n~=length(b)), error('dati inconsistenti'), end

itmax= ceil(-log10(tol))*m;
x= zeros(n,1);
tolb= tol*norm(b,inf);
for i= 1:itmax
    r= A*x-b;
    nr= norm(r,inf);
        if nr <= tolb, break, end
        
    v= Msolve(r,A);
    x= x-v ;
end

if nr>tolb, error ('tolleranza  non  raggiunta'), end

return

