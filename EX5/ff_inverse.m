function [y] = ff_inverse(x)

global x1;
global x2;
myVars = {'x1','x2'};
load('data.mat',myVars{:}); % load x1 and x2 values

[~,x1sim,x2sim] = simulation(x(1),x(2)); % obtain x1 and x2 values for given b1 and b2 values
y = norm(x1sim- x1) + norm(x2sim - x2); % return objective function

end

