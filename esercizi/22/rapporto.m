
n= 50; 
rapp= zeros(1,n);
for i=1:n
    pe= pesiNC(i);
    absP= 0;
    for j=1:i+1
        absP=absP + abs(pe(j));
    end
    rapp(i)=absP*1/n;
end

n=1:50;
figure
semilogy(n,rapp);
title( 'Rapporto');
legend('kn/k','location','northwest');


    