function [J,dJ] = ff_logistic_reg(Theta)

global X;
global Y;
load('data.mat');
m = size(Y,2); % number of samples
J = (-1/m)*sum(Y.*log(sigmoid(X,Theta)) + (1 - Y).*(log( 1 - sigmoid(X,Theta)))); % cost function

% if the number of output arguments are greater than 1, function calculates dJ  
if nargout > 1
dJ = (1/m)*(X)*transpose((sigmoid(X,Theta) - Y)); % gradient of the cost function
end

% sigmoid function (h(x,theta))
    function[h] = sigmoid(x,theta)
        
        h = (1 + exp(-transpose(theta)*x)).^(-1);
    end

end

