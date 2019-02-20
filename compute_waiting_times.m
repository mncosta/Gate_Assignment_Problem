function [ d_ij ] = compute_waiting_times( M_i,N_j,K )
%COMPUTE_WAITING_TIMES computes the waiting times for each plane i
%   Detailed explanation goes here

d_ij = [];

for i=1:size(M_i,1)
    weight=0;
    K_i = M_i{i}.time_schedule;
    weight_arr = zeros(size(K_i,2),1);
    
    for kk=1:size(K_i,2)
        if K_i(kk)==1
            weight_arr(kk) = weight;
            weight = weight + 1;
        else
            weight_arr(kk) = 0;
        end
    end
    
    for j=1:size(N_j,1)
        d_ij = cat(1,d_ij,weight_arr);
    end
end

d_ij = d_ij';

end

