function[y]=GaussSeidel(A,b)
% Function per la risoluzione del sistema tramite il metodo di Gauss-Seidel
% Input:
%       b= colonna vettore dei termini noti
%       A= matrice nxn
n= length(b);
y= b;

for i=1:n
    y(i)= y(i)/A(i,i);
    y(i+1:n)= y(i+1:n)- y(i)*A(i+1:n,i);
end

return