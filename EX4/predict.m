function [y] = predict(X,Theta)

m = size(X,2); % number of samples
boundary_matrix = 0.5*ones(1,m);  

y = sigmoid(X,Theta) >= boundary_matrix; % if h(x,theta) >= 0.5

% sigmoid function (h(x,theta))
  function[h] = sigmoid(x,theta)
        
        h = (1 + exp(-transpose(theta)*x)).^(-1);
  end
end

