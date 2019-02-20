function [ c_ij ] = compute_walking_distance( M_i, N_j,checkin_counters,baggage_location,K )
%COMPUTE_WALKING_DISTANCE computes the walking distance from each plane in
% M to the gates N_j
%   Detailed explanation goes here
    
checkin_counter_avg = mean(checkin_counters);
gates_avg = mean(N_j);

M = size(M_i,1);
N = size(N_j,1);

c_ij = zeros(M*N,1);

for i=1:M
    plane_i = M_i{i};
    
    if strcmp(plane_i.type, 'departure')
        c_i = zeros(N,1);
        for j=1:N
            gate_j = N_j(j,:);
            c_i(j) = norm(gate_j-checkin_counter_avg);
        end
        
    elseif  strcmp(plane_i.type, 'arrival')
        c_i = zeros(N,1);
        for j=1:N
            gate_j = N_j(j,:);
            c_i(j) = norm(gate_j-baggage_location);
        end
        
    elseif strcmp(plane_i.type, 'transfer')
        c_i = zeros(N,1);
        for j=1:N
            gate_j = N_j(j,:);
            c_i(j) = norm(gate_j-gates_avg);
        end
    end
    
    c_ij((i-1)*N+1:i*N) = c_i;
    
end

c_ij=repmat(c_ij,1,K)';
c_ij=c_ij(:)';

end
