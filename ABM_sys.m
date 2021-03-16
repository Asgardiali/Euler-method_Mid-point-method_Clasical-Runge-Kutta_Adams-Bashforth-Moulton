function [x,u]=ABM_sys(f,tspan,u0,n)

a=tspan(1);
b=tspan(2);
h=(b-a)/n;
hh=h/2;
x=a:h:b';
u(1,:)=u0;

for i=1:2
    k1=h*feval(f,a,u(i,:))';
    k2=h*feval(f,a+0.5*h,u(i,:)+0.5*k1)';
    u(i+1,:)=u(1,:)+k2;

end

for i=3:n
    z(i,:)=feval(f,x(i),u(i,:))';
    uu(i+1,:)=u(i,:)+hh*(23*z(i,:)-16*z(i-1,:)+5*z(i-2,:));
    zz=feval(f,x(i+1),uu(i+1,:))';
    u(i+1,:)=u(i,:)+hh*(5*zz+8*z(i,:)-z(i-1,:));

end
