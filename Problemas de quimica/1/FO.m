function p = FO(poblacion,Np,var,O)

    p = poblacion;
    for i=1:Np
        %Funcion Objetivo
        p(i,var+1) = p(i,1) + p(i,2) + p(i,3);
         
        %Restriciones 
        g(1) = 100*p(i,1)-p(i,1)*p(i,6)+833.33252*p(i,4)-83333.333;
        g(2) = p(i,2)*p(i,4)-p(i,2)*p(i,7)-1250*p(i,4)+1250*p(i,5);
        g(3) = p(i,3)*p(i,5)-p(i,3)*p(i,8)-2500*p(i,5)+1250000;
        
        
        h(1) = 0.0025*(p(i,4)+p(i,6))-1;
        h(2) = 0.0025*(-p(i,4)+p(i,5)+p(i,7))-1;
        h(3) = 0.01*(-p(i,5)+p(i,8))-1;

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