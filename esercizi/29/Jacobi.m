function [y]= Jacobi(A,b)
% Function per la risoluzione del sistema tramite il metodo di Jacobi
% Input:
%       b= colonna vettore dei termini noti
%       A= matrice  nxn
D= diag(A);
y= b./D;

return