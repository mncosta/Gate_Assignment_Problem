function [] = tidy_solution( x,M,N,K,start_time,int_duration )
%TIDY_SOLUTION Transform results into something a human can read
%   Detailed explanation goes here

x = reshape(x, [N*K,M])';

for i=1:size(x,1)
    idx = find(x(i,:));
    
    for j=1:N
        if (j-1)*K+1<=idx && idx<=j*K
            break
        end
    end
        
    r = rem(idx,K);
    if r == 0
        k=K;
    else
        k=r;
    end
    k = start_time + (k-1)*int_duration;
    
    disp(['Plane ',num2str(i),' was assigned to gate ',num2str(j),' at time ',num2str(hour(k)),':',num2str(minute(k)),'.'])
    
end

end

