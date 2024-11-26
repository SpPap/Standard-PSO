% ---------------------  PSO PARAMETERS  --------------------- %

s = 10;       % Swarm size
numVars = 2;  % Number of variables (dimensions)
w = 0.5;      % Inertia coefficient
c1 = 2;       % Nostalgia constant  (cognitive term)
c2 = 2;       % Envy constant       (social term)

totalIterations = 100; % Total iterations (stopping criterion)
lb = [0 0];            % Lower bounds
ub = [4 4];            % Upper bounds

% ----------------------------------------------------------- %