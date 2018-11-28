%function to solve for temperature distribution using the SOR method
function [T,E] = SOR(dx,dy,N,w)
nx = 1/dx + 1;
ny = 0.75/dy + 1;
beta = dx/dy;
T_i = T_init(nx,ny);
T = T_i;
T_a = T_anal(dx,dy,nx,ny);
for k = 1:N
    for j = 2:ny-1
        for i = 2:nx-1
            Q = i+(j-1)*nx;
            T(Q) = (1-w)*T_i(Q) + w*(T_i(Q+1) + T(Q-1) + beta^2*(T_i(Q+nx) + T(Q-nx)))/(2*(1+beta^2));
        end
    end
    eps = sum(abs(T - T_i))/sum(abs(T_i));
    if eps < 1e-6
        break;
    else 
        T_i = T;
    end
end
E = Error(T,T_a,nx,ny);       
end
