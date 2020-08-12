tol= 10^-8;
iter= zeros(50, 3);

for n= 10:10:500
    b= ones(n, 1); 
    iter(n/10, 1)= n; 
    [~, i]= splitting(b, @matvec, @Jacobi, tol);
    iter(n/10, 2)= i;
    [x, i]= splitting(b, @matvec, @gaussSeidel, tol) ;
    iter(n/10, 3)= i;   
end

figure
plot((10:10:500), iter(:, 2));
hold on

plot((10:10:500), iter(:, 3));
hold on

legend('Jacobi','Gauss-Seidel','location','northwest');
title('Iterazioni Jacobi e Gauss-Seidel');
