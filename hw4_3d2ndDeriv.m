function A = hw4_3d2ndDeriv(n)
    I = speye(n,n);
    E = sparse(2:n,1:n-1,1,n,n);
    D = E+E'-2*I;
    A = kron(D,I)*(n-1)^2+kron(I,D)*(n-1)^2;
    A = kron(A,eye(n^2)) + kron(eye(n^2),A);
end