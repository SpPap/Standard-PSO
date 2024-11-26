% Objective function to be minimized
% Michalewicz function of dimension d = 2 
%
% INPUTS:  x     - Design vector
% OUTPUTS: value - Function evaluation @ x
%
% Author: Spiros Papadopoulos
%

function value = objFunc(x)
    m = 10; % function parameter - steepness 
    value =  - (sin(x(:, 1)).*(sin(x(:, 1).^2/pi)).^(2*m) + ...
           sin(x(:, 2)).*(sin(2*x(:, 2).^2/pi)).^(2*m));
end

