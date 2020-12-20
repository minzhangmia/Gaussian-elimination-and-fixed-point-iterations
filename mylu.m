function [L,U,P] = mylu(A)
m = size(A,1);
P = eye(m);
L = zeros(m);
for j = 1:m-1  %J is the index column index
    fz = abs(A(j:end,j));
    [~,location_max] = max(fz);
    A([j,location_max+j-1],:) = A([location_max+j-1,j],:); %A matrix has rows whose positions are reversed
    P([j,location_max+j-1],:) = P([location_max+j-1,j],:);
    L([j,location_max+j-1],:) = L([location_max+j-1,j],:);
    for i = j+1:m  %I is the index row subscript
        cs = - A(i,j)/A(j,j);
        A(i,:) = A(i,:) + cs*A(j,:); %Subtract two row vectors by divisor
        L(i,j) = -cs; %Store the divisor in the corresponding matrix location
    end
end
for k = 1:size(L,1)
    L(k,k) = 1; %L has one diagonal element 
end
U = A;