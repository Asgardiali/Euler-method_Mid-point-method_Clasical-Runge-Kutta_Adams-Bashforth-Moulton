function du=fcn(x,u)

    % Verilen denklemde yapt���m d�n���mler;
    % y=u(1)    u(1)'=u(2)  u(2)'=u(2)+x+u(1)
    
    du=[u(2),u(1)+x+u(2)];
    
end
