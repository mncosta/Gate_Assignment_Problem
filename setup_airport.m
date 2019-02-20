function [N_j,checkin_counters,baggage_location] = setup_airport(N)
%SETUP_AIRPORT Create an airport
%   Detailed explanation goes here

N_j = create_gates( N );

checkin_counters = create_checkincounters( N );

baggage_location = create_baggage_claim();

clf(figure(1))
size=500;
figure(1),title('Airport'), hold on, 
scatter(N_j(:,1),N_j(:,2), size,'.r'), 
scatter(checkin_counters(:,1),checkin_counters(:,2), size,'.b'),
scatter(baggage_location(:,1),baggage_location(:,2), size,'.g'),
legend({'Gates','Check-in Counters','Baggage Claim Area'},'Location','southoutside'),

hold off

end

function [ checkin ] = create_checkincounters( N )

checkin = normrnd(0,0.1,[round(N/2), 2]);

end

function [ baggage ] = create_baggage_claim()

baggage = normrnd(0,0.2,[1, 2]);

end

function [ N_j ] = create_gates( N )

N_j = normrnd(0,1,[N, 2]);

end




