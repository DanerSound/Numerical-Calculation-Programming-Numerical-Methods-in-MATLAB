function [y]= gaussSeidel(x)
%  Risolve un sistema triangolare inferiore per la matrice dell'esercizio 26
%  Input:
%        x= vettore dei termini noti
n= length(x);
y= x;
y(1)= y(1)/4;

for i= 2:n    
    y(i)=(y(i)+ y(i-1))/4;  
end

for i= 9:n    
    y(i)=(y(i)+y (i-1))/4 ;   
end

return