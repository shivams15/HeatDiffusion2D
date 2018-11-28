%function to initialize the temperature distribution
function [T] = T_init(nx,ny)
T = 0.5*ones(nx*ny,1);
for j = 1:ny
    T(1+(j-1)*nx) = 0;
    T(j*nx) = 0;
end
for i = 1:nx
    T(i) = 1;
    T(i+(ny-1)*nx) = 0.25;
end
end