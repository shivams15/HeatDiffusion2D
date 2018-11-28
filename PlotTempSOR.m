%Plot the temperature profile obtained using SOR method
function PlotTempSOR(h,N,w)
[T,~] = SOR(h,h,N,w);
T_2D = reshape(T,1/h+1,0.75/h+1)';
x = 0:h:1;
y = 0:h:0.75;
[X,Y] = meshgrid(x,y);
contourf(X,Y,T_2D,25);
end