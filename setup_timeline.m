function [ K ] = setup_timeline( time_start,time_end, int_duration )
%SETUP_TIMELINE Setup working timeline
%   Detailed explanation goes here

working_time = time_end-time_start;

K = round(abs(working_time/int_duration));

end

