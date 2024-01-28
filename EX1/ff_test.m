function [test_value] = ff_test(t)
test_value = -cos(0.1*t)*exp(-(t/10-2*pi)^2) + 0.002*(t/10)^2; % return the objective function value
end

