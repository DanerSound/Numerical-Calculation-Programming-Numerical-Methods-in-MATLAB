function[x,i]=splitting(b, matvec, msolve, tol)
%  Funzione per la risoluzione adhoc di un sistema lineare con splitting
%  di  Jacobi  o  Gauss-Seidel
%  Input:
%        b= vettore dei termini noti
%        matvec= funzione per  creare  la  matrice  adhoc  per  esercizio  26
%        msolve= funzione per  risolvere il sistema  lineare
%        tol= tolleranza  desiderata

n= length(b);
itmax= ceil(-log10(tol))*(n*n);
x= zeros(n,1);
tolb= tol*norm(b,inf);

for i= 1:itmax
    r= matvec(x)-b;
    nr= norm(r,inf);
    if nr <= tolb, break, end
 
    u= msolve(r);
    x= x-u ;
end
if nr > tolb
    fprintf('Convergenza  non  raggiunta'), end

return
