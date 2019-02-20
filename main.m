%
%   OTIO Project
%
%   "Optimization of multiple objective gate assignments"
%   Shangyao Yan, Cheun-Ming Huo
%
%



M = 3;     % Number of available planes
N = 2;     % Number of available gates
K = 3;     % Number of times slots available
K_i = [];   % Availability of time schedules per flight i

B_i = [];    % Earliest time a flight i can be assigned to a gate
L_i = [];    % Latest time a flight i can be assigned to a gate

P_i = [];    % Total number of passengers on flight i

c_ij = [];  % Total walking distance for passengers on flight i to gate j

x_ijk = []; % Decision variable

F_j = [];   % Set of lights that can be assigned to gate j
H_is = [];  % Set of permitted times assigned to flight i where the resulting time windows will cover the s time

w = 1;    % Weight balance of the relative importance of waiting time to the walking time

K_i = [ 1 0 0;
        1 0 0;
        0 1 0;
        ];

% Exemplo: 2 planes, 3 gate, 3 time slots = 2*3*3=18 decision variables
variables = 18;
c_ij = setup_total_walking_distance(M,N,K);
f = c_ij;
intcon = 1:variables;
[A,b] = setup_inequalities(M,N,K,K_i);
[Aeq, beq] = setup_equalities(M,N,K,K_i);
lb = zeros(variables,1);
ub = ones(variables,1);

x = intlinprog(f,intcon,A,b,Aeq,beq,lb,ub);
results = reshape(x, [N*K,M])'














