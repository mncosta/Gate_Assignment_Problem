function [ A,b ] = setup_inequalities_planeService( M_i,N_j,K, serviceTime  )
%SETUP_INEQUALITIES_PLANESERVICE Summary of this function goes here
%   Detailed explanation goes here

A = zeros(0, size(M_i,1)*size(N_j,1)*K);

for k=1:K-serviceTime+1
    for j=1:size(N_j,1)
        nogate = [];
        for j_=1:j-1
            nogate = cat(1,nogate,zeros(K,1));
        end
        
        arr = zeros(K,1);
        arr(k:k+serviceTime-1) = ones(serviceTime,1);
        nogate = cat(1,nogate,arr);

        for j_=j:size(N_j,1)-1
            nogate = cat(1,nogate,zeros(K,1));
        end
           
        aux = [];
        for i=1:size(M_i,1)
            aux = cat(1,aux,nogate);
        end
        
        A(end+1,:) = aux';        
    end
    whos A
end


b = ones(size(A,1),1);

end

