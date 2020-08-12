function [Int]= trapComp(func, a, b, n)
% Function che approssima l’integrale definito da f(x) con 
% estremi a,b mediante la formula di Trapezi composita
% Input:
%       func= funzione da approssimare
%       a,b= estremi di integrazione     
%       n= numero suddivisione 
format long;
if a==b
    Int= 0;
else
    if n<1
        error('numero di ascisse non consistente');
    else
        h= (b-a)/n;
        x= linspace(a ,b ,n+1);
        f= feval(func, x);
        
        S= 0.5*(f(1)+f(n+1));
        for i=2:n
            S=S+f(i);
        end
        Int= h*S;
    end
   return
   
end

