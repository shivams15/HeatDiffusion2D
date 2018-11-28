%function to solve a tridiagonal system of equations
function Q = TriDiagSolver(N,Q,L,U,D)
for k = 2:N
    D(k) = D(k) - U(k-1)*L(k)/D(k-1);
    Q(k) = Q(k) - Q(k-1)*L(k)/D(k-1);
end
Q(N) = Q(N)/D(N);
for k = N-1:-1:1
    Q(k) = (Q(k) - U(k)*Q(k+1))/D(k);
end
end