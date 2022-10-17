clear;
clc;
%------Solución numérica por Forward-Euler------
h= 0.01;
Tlim= 1000;
n= Tlim/h;
a= 0.4;
b= 0.5;
c= 0.3;
d= 1.0;
k = 1;
x=zeros(1,n+1);
y=zeros(1,n+1);
z=zeros(1,n+1);
x(1,1) = 1;
y(1,1) = 1;
z(1,1) = 1;
for i=1:n
    x(1,i+1) = x(1,i) + (y(1,i)*h);
    y(1,i+1) = y(1,i) + (z(1,i)*h);
    if x(1,i+1) > 1
        f0 = k;
    elseif abs(x(1,i+1)) <= 1
        f0 = x(1,i+1);
    else
        f0 = -1*k;
    end
    z(1,i+1) = z(1,i) + ((-a*x(1,i) - b*y(1,i) - c*z(1,i) + d*f0)*h);
end
plot(x,y)