function p = FO(poblacion,Np,var,O)

p = poblacion;
    for i=1:Np
        %Funcion Objetivo
    
        p(i,var+1) = - p(i,4);
         
        % Restricciones de desigualdad
        g(1) = max(0,(p(5)^0.5)+(p(6)^0.5)-4);
        
        % Restricciones de igualdad
        k1 = 0.09755988;
        k2 = 0.99*k1;
        k3 = 0.0391908;
        k4 = 0.9*k3;
        
        h(1) = (p(i,1)+k1*p(i,1)*p(i,5)-1);
        h(2) = (p(i,2)-p(i,1)+k2*p(i,2)*p(i,6));
        h(3) = (p(i,3)+p(i,1)+k3*p(i,3)*p(i,5)-1);
        h(4) = (p(i,4)-p(i,3)+p(i,2)-p(i,1)+k4*p(i,4)*p(i,6));
        v1 = 0;
            for ii=1:length(g)
                v1 = v1 + max(0,g(ii));
            end
        
            v2 = 0;
            for j=1:length(h)
                v2 = v2 + max(0,abs(h(j))-O);
            end
        
            SVR = v1 + v2;
        
            p(i,var+2) = SVR;
    end
end