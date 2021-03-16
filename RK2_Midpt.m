function [x,y,yt]=RK2_Midpt(f,tspan,y0,yt0,n)

a=tspan(1);
b=tspan(2);
h=(b-a)/n;
x=(a+h):h:b;

k1=((h^2)/2)*feval(f,a,y0,yt0);
k2=((h^2)/2)*feval(f,(a+(2/3)),y0+((2/3)*h*yt0)+(b*k1),(yt0+(3*h/4)*k1));

y(1)=y0+h*yt0+0.5*k1+0.5*k2;
yt(1)=yt0+(1/h)*yt0+0.5*k1+1.5*k2;

for i=1:n-1
    k1=((h^2)/2)*feval(f,x(i),y(i),yt(i));
    k2=((h^2)/2)*feval(f,x(i)+(2/3),y(i)+((2/3)*h*yt(i))+(b*k1),(yt(i)+((4/3)/h)*k1));
    y(i+1)=y(i)+h*yt(i)+0.5*k1+0.5*k2;
    yt(i+1)=yt(i)+(1/h)*yt(i)+0.5*k1+1.5*k2;
end
x=[a x];
y=[y0 y];
yt=[yt0 yt];

