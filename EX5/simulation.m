function [t,x1,x2] = simulation(b1,b2)

% constants
m1 = 5;
m2 = 5;
k1 = 1;
k2 = 1;
F = 1;

global t;

load('data.mat','t'); % load variablle t

x0 = [0 0 0 0]; % initial values

[tresult,X] = ode45(@(t,xsol) odefcn(t,xsol,m1,m2,k1,k2,F,b1,b2),t,x0);
x1 = X(:,1); % x1 value
x2 = X(:,3); % x2 value

% system of the equations 
function [dxdt] = odefcn(t,xsol,m1,m2,k1,k2,F,b1,b2)
dxdt = zeros(4,1);
dxdt(1) = xsol(2);
dxdt(2) = (-b1*xsol(2) - b2*(xsol(2) - xsol(4)) - k1*xsol(1) - k2*(xsol(1) - xsol(3)))/m1;
dxdt(3) = xsol(4);
dxdt(4) = (F + b2*(xsol(2) - xsol(4)) + k2*(xsol(1) - xsol(3)))/m2;
end

end

