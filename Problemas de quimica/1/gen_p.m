function P = gen_p(li,ls,var,NP) 
    P =[];
    %P = zeros(NP,var);
    for i=1:NP
        for j=1:var
            P(i,j) = li(1,j) + (ls(1,j)-li(1,j))*rand();
        end
    end
end