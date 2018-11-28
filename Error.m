%function to calculate error
function [E] = Error(T,T_a,nx,ny)
E = 0;
for i = 2:nx-1
    for j = 2:ny-1
        Q = i+(j-1)*nx;
        E = E + (T(Q) - T_a(Q))^2;
    end
end
E = sqrt(E)/((nx)*(ny));
end