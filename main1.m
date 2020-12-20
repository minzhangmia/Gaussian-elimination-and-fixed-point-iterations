clc
clear all
close all
format short
n = [5 10 20 30 40 50 60]; 
for i = 1:length(n)
    for j = 1:1000
        A = mat_make(n(i)); %Generate initial matrix
        a_max = max(max(abs(A))); 
        [L,U,P] = mylu(A);
        u_max = max(max(abs(U)));
        growth_factor(i,j) = abs(u_max) / abs(a_max); %Find the growth factor
    end
end

for k = 1:size(growth_factor,1)
    fw_gf = linspace(min(log10(growth_factor(k,:))),max(log10(growth_factor(k,:))),10); %The frequency statistical interval was constructed
    figure()
    hist(round(log10(growth_factor(k,:)),1),fw_gf) %Draw the frequency interval histogram of each n corresponding to the order
    title_str = ['n=' num2str(n(k))];
    title(title_str)
end

ave_growth_factor = mean(growth_factor,2); %Calculate the average growth rate for each n and save the results in the AVe_growth_factor matrix
figure()
semilogy(n,ave_growth_factor')


% A = [2 1 1 0;4 3 3 1;8 7 9 5;6 7 9 8];
% [L,U,P] = mylu(A);
