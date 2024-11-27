% Main script for standard Particle Swarm Optimization (PSO) algorithm
%
% Author: Spiros Papadopoulos
%

% Clear workspace & CMD
clear
clc

% Plot settings
set(0, 'DefaultFigureColor', 'white');

% Objective function to be minimized
c = @objFunc;

% PSO Settings
psoSettings()

% Initialize position and velocity vectors for each particle of the swarm
x(:,:,1) = [lb(1) + (ub(1)-lb(1)).*rand(s,1) lb(2) + (ub(2)-lb(2)).*rand(s,1)];
v(:,:,1) = zeros(s,numVars);

% Generate meshgrid to plot surface of the cost function
figure(1)
xi = linspace(0, 4, 400);
yi = linspace(0, 4, 400);
[X, Y] = meshgrid(xi, yi);
grid_points = [X(:), Y(:)];

% Evaluate the function on the grid
Z = c(grid_points);
Z = reshape(Z, size(X));

% contour(X, Y, Z)
%% Run PSO until stopping criterion is satisfied
k = 1;
fprintf("PSO Optimizer Starts\n\n");
tStart = tic; 
while k <= totalIterations
    % Display iteration
    fprintf("Iteration: %d\n", k);

    % 3D Visualization of PSO operation
    cla
    surfc(X, Y, Z, 'EdgeColor', 'none', 'FaceAlpha', 0.5)
    colorbar
    colormap("summer")
    % Update Plot
    xlim([lb(1) ub(1)])
    ylim([lb(2) ub(2)])
    hold on;
    scatter3(x(:,1,k), x(:,2,k), c([x(:,1,k) x(:,2,k)]), 'r*');
    title(['Iteration # ', num2str(k)]);
    xlabel('x_1');
    ylabel('x_2');
    grid on;
    fontsize(gcf,12,"points")
    fontname(gcf,'Helvetica')
    pause(0.1);
    % Uncomment next line IF you want to save GIF animation of PSO
%     exportgraphics(gcf,'psoAnimation.gif','Append',true); 

    % Evaluate objective function for all particles
    c_eval(:,:,k) = c(x(:,:,k));
    % Find global best 
    [cMin, iMin] = min(c_eval(:,:,k));
    y_swarm(:,:,k) = x(iMin,:,k); % best position of the swarm at time instance k
    % Find personal best 
    if k == 1
        y_personal(:,:,k) = x(:,:,k); % best personal position 
    else
        iBetterPersonal = c_eval(:,:,k) < c_eval(:,:,k-1); % check for better personal
        y_personal(:,:,k)  = y_personal(:,:,k-1);
        y_personal(iBetterPersonal,:,k)  = x(iBetterPersonal,:,k);
        
    end
    % Iterate particles
    for iParticle = 1:s       
        % Pick random values r1, r2 from uniform distribution [0, 1]
        r1 = rand();
        r2 = rand();
        % Iterate dimensions
        for jDim = 1:numVars
            v(iParticle,jDim,k+1) = w*v(iParticle,jDim,k) + ...
                                    c1*r1*(y_personal(iParticle,jDim,k) - x(iParticle,jDim,k)) + ...
                                    c2*r2*(y_swarm(:,jDim,k) - x(iParticle,jDim,k));
            x(iParticle,jDim,k+1) = x(iParticle,jDim,k) + v(iParticle,jDim,k+1); 
        end 
        % Clamping
        x = min(max(x, lb), ub);
    end
    k = k + 1;
end
tEnd = toc(tStart);   
hold off

%% Display Results
fprintf(" -------- Optimization Results -------- \n");
x1_best = y_swarm(:,1,end);
x2_best = y_swarm(:,2,end);
cEval = c([x1_best x2_best]);
fprintf(" Total iterations: %d\n", totalIterations);
fprintf(" Time elapsed: %.3f sec\n", tEnd);
fprintf(" var x1* =  %.8f \n var x2* =  %.8f\n feval   = %.4f\n", x1_best, x2_best, cEval)
fprintf(" -------------------------------------- \n");

% Plot function evaluation
figure("Name", "Objective Function Evaluation")
x1Best = y_swarm(:,1,:);
x2Best = y_swarm(:,2,:);
x1x2Best = [x1Best(:) x2Best(:)];
funcBest = c(x1x2Best);

plot(1:totalIterations, funcBest, '-ok', 'LineWidth', 1.25, 'MarkerFaceColor','auto')
title('Cost Function Evaluation')
ylabel('Cost Function Value')
xlabel('Iteration #')
fontsize(gcf,16,"points")
fontname(gcf,'Helvetica')





