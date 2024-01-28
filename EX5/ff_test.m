function [test_value] = ff_test(x)

test_value = x(1).^2 + x(2).^2 - cos(2.5*pi*x(1)) - cos(2.5*pi*x(2)) + 2; % return the objective function value

end

