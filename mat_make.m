function A = mat_make(n)
A = zeros(n,n);
for i = 1:size(A,1)
    for j = 1:size(A,2)
        if i == j || j == n %���A������λ���ǶԽ���Ԫ�ػ��������һ��Ԫ�أ��򽫸�λ��Ԫ����1
            A(i,j) = 1;
        elseif i > j
            A(i,j) = -rand; %�����������������
        end
    end
end