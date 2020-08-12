function [aprox] = intAp(func,a,b,n)
% Funzione che ritorna l'approssimazione della funzione in ingresso
% nell'intervallo a,b considerato con un numero di suddivisioni pari ad n  
% Input: 
%        func= funzione da aprossimare
%        a,b= estremi di integrazione
%        n = numero di sottointervalli sui quali applicare la formula dei pesi.
format short;
if a==b
    error("impossibile esseguire approssimazione");
else
    s= 0;
    for i=1:n
        x= linspace(a,b,i+1);
        f= feval(func,x);
        pe= pesiNC(i);
        h= (b-a)/i;
        for j=1:i+1
            s= pe(j)*f(j);
        end
        app= s*h;
    end
    int= integral(func,a,b);
    errAp= int-app;
    aprox= [app errAp];
    return
    
end

