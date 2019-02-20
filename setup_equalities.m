function [ Aeq,beq ] = setup_equalities( M,N,K,K_i )
%SETUP_EQUALITIES Return equalities equation coeficients
%   Detailed explanation goes here

Aeq = zeros(M, M*N*K);

for i=1:M
    repeating_array = K_i(i,:);
    A_i = repmat(repeating_array, 1, N); 
    Aeq(i,(i-1)*N*K+1:i*N*K) = A_i;
end

beq = ones(M,1);

end
