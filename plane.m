classdef plane
    %PLANE Plane object
    %   Detailed explanation goes here
    
    properties
        type
        time_schedule
        size
    end
    
    methods
        function obj = plane(type,time_schedule,size)
            if  nargin == 3
                obj.type=type;
                obj.time_schedule = time_schedule;
                obj.size = size;
            end
        end
    end
    
end

