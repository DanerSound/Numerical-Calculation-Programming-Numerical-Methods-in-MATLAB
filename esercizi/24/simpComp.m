function [Int]= simpComp(func,a,b,n)
% Function che approssima l’integrale definito da f(x) con estremi a, b 
% mediante la formula di Simpson composita su n+1 ascisse equidistanti.
% Input:
%       func= funzione da approssimare
%       a,b= estremi di integrazione
%       n= numero suddivisione pari di intervalli
format long;
if a==b
    Int=0;
else
    if(n <2 || mod(n,2)~=0)
        error("numero di ascisse non consistente");
    else
        h= (b-a)/n;
        x= linspace(a,b,n +1);
        f= feval(func ,x);
        
        S=(f(1)+f(n+1));
        S= S+4*sum(f(2:2:n))+ 2*sum(f(3:2:n-1));
        Int= (h/3)*S;
    end
    return
    
end

