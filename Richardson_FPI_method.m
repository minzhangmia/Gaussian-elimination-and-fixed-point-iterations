function [x,err,error_bound]=Richardson_FPI_method(A,x0,b,eps)
%% input:
% matrix A
% initial x0
% right end item B
% error margin EPS
%% output:
% solution x to the equation
% error err
% Theoretical error bounds error_bound
[m,n]=size(A);
[L,U,P] = mylu(A);
I=eye(n);
M_1 = inv(L)*inv(U)*P;
Initial=b-(A*x0);
k= 0;
while (Initial)>eps
    x0 = (I - (M_1 * A))*x0 + (M_1 * b); 
    xx=b -(A*x0);
    Initial =norm(b -(A*x0));
    k = k + 1;
    err(k)=Initial;
end
x=x0;
p=min(abs(eig(A)));
for i=1:length(err)
error_bound(i)=1/p^i*err(i);
end
error_bound=abs(error_bound);
end