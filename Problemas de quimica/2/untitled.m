clc;

clear
% Parámetros del algoritmo DE
var = 6;
NP = 20;  % Tamaño de la población
F = 0.7;  % Factor de amplificación-muta
CR = 0.7; % Tasa de recombinación
O = 1e-5;
generaciones = 3000; % Número de generaciones

% Límites de las variables

li = [0, 0, 0, 0, 0.00001, 0.00001];

ls = [1 1 1 1 16 16];

% Generar la población inicial
poblacion = gen_p(li,ls,var,NP);

poblacion = FO(poblacion,NP,var,O);


for g=1:generaciones
    g
    for i=1:NP
        % Seleccionar tres padres aleatorios distintos entre si, te amo <3
        n = 1:NP;
        n = setdiff(n,i);
        padres = n(randperm(NP-1,3));
        
        %Generar Ruido
        v = poblacion(padres(1),1:var) + F*(poblacion(padres(2),1:var) - poblacion(padres(3),1:var));
        
        % Corregir desbordamiento
        v = corregir_desbordamiento(v, li, ls);
        
        %Realizar la recombinación binomial
        u = poblacion(i,1:var);
        j_rand = randi(var);
        for j = 1:var
            if j == j_rand || rand() < CR
                u(j) = v(j);
            end
        end
        
        %Evaluar FO y SVR
        u = FO(u,1,var,O);
        
        %Seleccion con DEV
        poblacion(i,:) = DEB(poblacion(i,:),u,var);
    end


    poblacion    
end

[best, idx] = min(poblacion(:,var+1));
x_best = poblacion(idx,:);

% Imprimir la mejor solución y su valor de función objetivo
disp("La mejor solución es:")
disp(x_best)
disp("Valor de función objetivo:")
disp(best)


