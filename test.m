
tic
%% Setup user-defined variables

N=24;
M = 50;
time_interval = 10;
plane_availability_radius = 2;
plane_service_time = 2;

weight_waiting_time = 1;

work_start = datetime(0,0,0,5,0,0);
work_end = datetime(0,0,0,8,0,0);

speed_avg = 1.0; % meters/second



%% Generate Data

time_intervals = minutes(time_interval);

[N_j,checkin_counters,baggage_location] = setup_airport(N);

K = setup_timeline(work_start,work_end,time_intervals)

total_number_decision_variables = M*N*K;

[M_i, K_i] = setup_airplanes(M,K,plane_availability_radius);
for i=1:M
    M_i{i}
end



%% Compute Cost Matrices

c_ij = compute_walking_distance( M_i,N_j,checkin_counters,baggage_location,K );
C = c_ij*100/speed_avg;

d_ij = compute_waiting_times(M_i,N_j,K);
D = d_ij*time_interval;

Cost = C + weight_waiting_time*D;



%% Setup the problem and solve it

f = Cost;

intcon = 1:total_number_decision_variables;

[A1,b1] = setup_inequalities_gates(M,N,K,K_i);
% tic
% [A2,b2] = setup_inequalities_planeService(M_i,N_j,K, 2);
% toc
% tic
[A2,b2] = setup_inequalities_planeService_1(M_i,N_j,K, plane_service_time);
% toc
A = cat(1,A1,A2);
b = cat(1,b1,b2);

[Aeq, beq] = setup_equalities(M,N,K,K_i);

lb = zeros(total_number_decision_variables,1);
ub = ones(total_number_decision_variables,1);

whos Aeq beq A1 A2 b Cost ub
options = optimoptions('intlinprog','MaxTime',120,'Display','iter');
[x,fval1,exitflag1,output1] = intlinprog(f,intcon,A,b,Aeq,beq,lb,ub,options);
tidy_solution(x,M,N,K,work_start,time_intervals);
plot_solution(x,M,N,K,work_start,time_intervals,plane_service_time);

savefig(figure(1), 'figure1.fig')
savefig(figure(2), 'figure2.fig')

toc
