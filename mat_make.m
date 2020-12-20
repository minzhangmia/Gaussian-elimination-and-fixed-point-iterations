function A = mat_make(n)
A = zeros(n,n);
for i = 1:size(A,1)
    for j = 1:size(A,2)
        if i == j || j == n %如果A的索引位置是对角线元素或者是最后一列元素，则将该位置元素置1
            A(i,j) = 1;
        elseif i > j
            A(i,j) = -rand; %否则用随机数来代替
        end
    end
end