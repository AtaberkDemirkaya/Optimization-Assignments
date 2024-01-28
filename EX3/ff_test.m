function [test_value] = ff_test(x)
test_value = sin(sqrt(x(1).^2 + x(2).^2))./(sqrt(x(1).^2 + x(2).^2)); % return the objective function value
end

