function [ A,b ] = setup_inequalities_gates( M,N,K,K_i )
%SETUP_INEQUALITIES Return inequalities equation coeficients
%   Detailed explanation goes here

A = zeros(N*K,M*N*K);

for j=1:N
    for i=1:M
        for k=1:K
            plane_available = K_i(i,k);
            
            A((j-1)*K+k,get_decison_idx( i,j,k,N,K )) = plane_available;
        end
    end
end

b = ones(N*K,1);

end



