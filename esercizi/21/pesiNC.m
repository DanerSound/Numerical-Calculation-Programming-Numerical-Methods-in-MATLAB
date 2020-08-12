function [cin] = pesiNC(n)
% Funzione che ritorna i pesi della formula di Newton-Cotes
% Input:
%   n = numero di sottointervalli sui quali applicare la formula.
prod= @(t) t;                   
cin= zeros(1,n+1);            
for i=0:n
    func{i+1}=@(t) 1;
    for j=0:n
        if j~=i
            func{i+1}= @(t) func{i+1}(t).*(prod(t)-j)/(i-j);
        end
    end
    cin(i+1)= integral(func{i+1},0,n);
end
return

end

 