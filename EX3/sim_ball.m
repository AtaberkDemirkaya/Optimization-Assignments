function [t,x,y,x50] = sim_ball(v0x,w)

% constants
m = 0.6;
r = 0.12;
C = 0.47;
ro = 1.2;
g = 9.81;
S = pi*r^2;


tspan = 0:0.01:7;
options = odeset("Events",@myEventFcn);
xy0 = [0 v0x 100 0]; % initial values
[t,xysol] = ode45(@(t,xysol) odefcn(t,xysol,m,r,C,ro,g,S,w),tspan,xy0,options);

x = xysol(:,1);
y = xysol(:,3);
% find the x50 value
[~,index] = min(abs(50 - xysol(:,3)));
x50 = xysol(index,1);

% system equation
function [dxydt] = odefcn(t,xysol,m,r,C,ro,g,S,w)
dxydt = zeros(4,1);
dxydt(1) = xysol(2);
dxydt(2) = (-ro*xysol(4)*w*pi*r^3 - 0.5*C*ro*S*(xysol(2))*abs(xysol(2)))/m;
dxydt(3) = xysol(4);
dxydt(4) = (-ro*xysol(2)*w*pi*r^3 - 0.5*C*ro*S*(xysol(4))*abs(xysol(4)) - m*g)/m;
end

% this function stops the algorithm when y is equal or smaller than 0 
function [value,isterminal,direction] = myEventFcn(t,y)
value = y(3);
isterminal = 1;
direction = 0;
end

end

