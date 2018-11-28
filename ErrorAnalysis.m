
clear all;
%function to draw log (error) versus log(?x*) plots
figure(1)
dx = [0.0125,0.015625,0.02];
e1 = zeros(size(3,1));
e2 = e1;
for z = 1:3
    [T,E] = SOR(dx(z),0.01,2500,1.9);
    e1(z) = E;
    [T,E] = ADI(dx(z),0.01,2500);
    e2(z) = E;
end
plot(log(dx),log(e1),log(dx),log(e2));

%function to draw log (error) versus log(?y*) plots
figure(2)
dy = [0.0125,0.015,0.01875];
for z = 1:3
    [T,E] = SOR(0.01,dy(z),2500,1.9);
    e1(z) = E;
    [T,E] = ADI(0.01,dy(z),2500);
    e2(z) = E;
end
plot(log(dy),log(e1),log(dy),log(e2));

% function to plot the variation in error with number of iterations for different w
figure(3)
e = zeros(25,1);
for N = 10:10:250
    [T,E] = ADI(0.015625,0.015625,N);
    e(N/10) = E;
end
plot(10:10:250,e);
hold on;
for w = [1,1.2,1.4,1.6,1.8,1.99]
    for N = 10:10:250
        [T,E] = SOR(0.015625,0.015625,N,w);
        e(N/10) = E;
    end
    plot(10:10:250,e);
end



