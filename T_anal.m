%function to evaluate the analytical solution
function [T] = T_anal(dx,dy,nx,ny)
T = zeros(nx*ny,1);
for j = 1:ny
    for i = 1:nx
        Q = i+(j-1)*nx;
        for m = 1:2:1001
            A = 4*sin(m*pi*(i-1)*dx)/(m*pi);
            T(Q) = T(Q) + A*0.25*(1-exp(-2*m*pi*(j-1)*dy))/(exp(m*pi*(0.75-(j-1)*dy))-exp(-m*pi*(0.75+(j-1)*dy)));
            T(Q) = T(Q) + A*(1-exp(-2*m*pi*(0.75-(j-1)*dy)))/(exp(m*pi*(j-1)*dy)-exp(m*pi*(-1.5+(j-1)*dy)));
        end
    end
end
end