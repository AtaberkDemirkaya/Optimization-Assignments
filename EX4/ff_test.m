function [y,dy] = ff_test(x)

y = (x(1) + 2*x(2) - 7).^2 + (2*x(1) + x(2) - 5).^2; % return the objective function value
% if the number of output arguments are greater than 1, function calculates dy  
if nargout > 1
dy = [ 2*(x(1) + 2*x(2) - 7) + 4*(2*x(1) + x(2) - 5), 4*(x(1) + 2*x(2) - 7) + 2*(2*x(1) + x(2) - 5)]; % return the gradient vector of objective function 
end

end

