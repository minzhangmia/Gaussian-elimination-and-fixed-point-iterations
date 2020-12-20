% richardson Fixed point iteration method is used to solve sparse matrix equations
clc
clear
close all
format long
%% calculate LM matrix
A= hw4_3d2ndDeriv(3); %getting matrix L
M=tridiag(A);% getting matrix M
%% LU decomposition and Richardson solution
% [L,U,P] = mylu1(A);
[m,n]=size(A);
x0=zeros(n,1);
b=ones(n,1);
eps = 10^(-8);
[x,err,error_bound]=Richardson_FPI_method(A,x0,b,eps);
disp('The  approximately solution of this question is:')
x = x
x1=1:length(error_bound);
semilogy(x1,err,'g*-')
hold on
semilogy(x1,error_bound,'rp-')
xlabel('Interaction Times')
ylabel('Error')
legend('Error','Upper Bound Error Convergence')
title('Upper Bound Error Convergence vs Error')