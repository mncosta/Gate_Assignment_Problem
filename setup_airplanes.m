function [ M_i, K_i ] = setup_airplanes( M,K,kk )
%SETUP_AIRPLANES Setup airplanes
%   Detailed explanation goes here



M_i = cell(M,1);

for i=1:M
    
    type = randi([0 2],1,1);
    if type == 0
        type = 'departure';
    elseif type==1
        type = 'arrival';
    elseif type==2
        type = 'transfer';
    end
    
    k = randi([1 K],1,1);
    K_i = zeros(1,K);
    K_i(k) = 1;
    for k_=k-kk:k+kk
       if k_<1
           continue
       elseif k_>K
           continue
       else
           K_i(k_) = 1;
       end
    end
    
  
    size = 1;

    M_i{i} = plane(type,K_i,size);
    
end

K_i = zeros(M,K);
for i=1:M
    K_i(i,:) = M_i{i}.time_schedule;
end

end

