function [x,y]=Euler(f1,f2,tspan,y0,z0,n)

a=tspan(1);
b=tspan(2);
h=(b-a)/n;
x=(a+h:h:b);
y(1)=y0+h*feval(f1,z0);
z(1)=z0+h*feval(f2,a,y0,z0);

for i=2:n
    % Verilendenklemi d^2y/dx^2=> d/dx*dy/dx dy/dx=z dedim. dz/dx=z+x+y e
    % dönüþtürdüm buna göre iþlem yaptým.
    y(i)=y(i-1)+h*feval(f1,z(i-1));
    z(i)=z(i-1)+h*feval(f2,x(i-1),y(i-1),z(i-1));
end

x=[a x];
y=[y0,y];
end