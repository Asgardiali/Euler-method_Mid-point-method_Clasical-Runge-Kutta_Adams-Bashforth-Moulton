function [x,y]=ClassicRK(f,tspan,y0,p0,n)

a=tspan(1);
b=tspan(2);
h=(b-a)/n;
x=a:h:b;

% Denklemde y' yerine p deðiþkenini kullandým. 
% f(p,x,y) oluþturduðum denklem

j1=h*feval(f,p0,a,y0);
k1=h*p0;
j2=h*feval(f,p0+0.5*j1,a+0.5*h,y0+0.5*k1);
k2=h*(p0+0.5*j1);
j3=h*feval(f,p0+0.5*j2,a+0.5*h,y0+0.5*k2);
k3=h*(p0+0.5*j2);
j4=h*feval(f,p0+j3,a+h,y0+k3);
k4=h*(p0+j3);

p(1)=p0+(1/6)*(j1+2*j2+2*j3+j4);
y(1)=y0+(1/6)*(k1+2*k2+2*k3+k4);



for i=1:n
    
    j1=h*feval(f,p(i),x(i),y(i));
    k1=h*p(i);
    j2=h*feval(f,p(i)+0.5*j1,x(i)+0.5*h,y(i)+0.5*k1);
    k2=h*(p(i)+0.5*j1);
    j3=h*feval(f,p(i)+0.5*j2,x(i)+0.5*h,y(i)+0.5*k2);
    k3=h*(p(i)+0.5*j2);
    j4=h*feval(f,p(i)+j3,x(i)+h,y(i)+k3);
    k4=h*(p(i)+j3);
    
    p(i+1)=p(i)+(1/6)*(j1+2*j2+2*j3+j4);
    y(i+1)=y(i)+(1/6)*(k1+2*k2+2*k3+k4);
    
    
end


