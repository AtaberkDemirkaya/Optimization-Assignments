function [t,alpha,omega] = sim_arm(k1,k2)

% constant values
l = 0.5;
mr = 1;
mc = 10;
b = 0.5;
wref = 0;
alpha_ref = pi;
I = l^2*(mr/3 + mc);

% define variable
syms a(t) 
w = diff(a,t);
% initial values
cond1 = a(0) == 0;
cond2 = w(0) == 0;
conds = [cond1;cond2];
% system equation
ode = I*diff(a,t,2) + diff(a,t)*(b + k2) == -k1*a + k1*alpha_ref + k2*wref;

% return the time samples, position, and velocity
alpha = dsolve(ode,conds);
omega = diff(alpha,t);
t = 0:0.1:100;

end

