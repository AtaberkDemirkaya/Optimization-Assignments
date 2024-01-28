function [Q] = ff_arm(k0)

k1 = k0(1);
k2 = k0(2);
wref = 0;
alpha_ref = pi;

[t,alpha,omega] = sim_arm(k1,k2); % return the time samples, position, and velocity
M = k1*(alpha_ref - alpha) + k2*(wref - omega); % moment of force
F = 10*(alpha_ref - alpha)^2 + (wref - omega)^2 + M^2; % integrand

F_par = matlabFunction(F); % convert symbolic expression to function handle
Q = trapz(t,F_par(t)); % return objective function

end

