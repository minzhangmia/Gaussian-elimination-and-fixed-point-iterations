function T = tridiag(a, b, c, n)
% T  =  tridiag(a,b,c,n)
% T  =  tridiag(A)
%
% FUNCTION INFORMATIONS FOR tridiag(a,b,c,n)
%
% Makes the matrix tridiag(a,b,c) of size n x n.
%
% INPUTS:
%    a  a number for the constant subdiagonal
%    b  a number for the diagonal
%    c  a number for the superdiagonal
%    n  what is the size
%
% FUNCTION INFORMATIONS for tridiag(A)
%
% Extracts the tridiagonal part of a matrix.
%
% INPUTS:
%    A   An nxn matrix
%
% OUTPUTS:
%    T   The tridiagonal part of A
%
% Kirk M. Soodhalter
% 27-Nov-2020 23:25:21
% kirk@math.soodhalter.com

    if nargin == 4 %build tridiagonal
        sub = diag(ones(n-1,1),-1);
        T = b*eye(n) + a .* sub + c .* sub';
    elseif nargin == 1 %extract tridiagonal
        T=diag(diag(a)) + diag(diag(a,-1),-1) + diag(diag(a,1),1);
    else
        error('The number of inputs is not value (needs either 1 or 4).')
    end

end
