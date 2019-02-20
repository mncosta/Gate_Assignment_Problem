function [ idx ] = get_decison_idx( i,j,k,N,K )
%GET_DECISON_IDX Summary of this function goes here
%   Detailed explanation goes here

    idx = (i-1)*N*K + (j-1)*K + k;

end

