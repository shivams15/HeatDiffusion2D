%function to solve for temperature distribution using the ADI method
function [T,E] = ADI(dx,dy,N)
nx = 1/dx + 1;
ny = 0.75/dy + 1;
beta = dx/dy;
T_i = T_init(nx,ny);
T = T_i;
T_a = T_anal(dx,dy,nx,ny);
Lx = ones(nx-2,1);
Dx = -2*(1+beta^2)*Lx;
Ux = Lx;
Ly = beta^2*ones(ny-2,1);
Dy = -2*(1+beta^2)*ones(ny-2,1);
Uy = Ly;
for k = 1:N
    Z = zeros(nx-2,1);
    for j = 2:ny-1
        for i = 2:nx-1
            Q = i+(j-1)*nx;
            Z(i-1) = -beta^2*(T_i(Q+nx) + T(Q-nx));
        end
        T((j-1)*nx+2:j*nx-1) = TriDiagSolver(nx-2,Z,Lx,Ux,Dx);
    end
    T_int = T;
    Z = zeros(ny-2,1);
    for i = 2:nx-1
        for j = 2:ny-1
            Q = i+(j-1)*nx;
            Z(j-1) = -T_int(Q+1) - T(Q-1);
        end
        Z(1) = Z(1) - beta^2;
        Z(ny-2) = Z(ny-2) - 0.25*beta^2;
        T(nx+i:nx:i+(ny-2)*nx) = TriDiagSolver(ny-2,Z,Ly,Uy,Dy);
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