function [t,VA,VB,TB] = sim_tanks(DA)

tspan = [0:1000];
opts = odeset("NonNegative",1); % choose the nonnegative values because volume cannot be negative
y0 = [5 1 10]; % initial values
[t,ysol] = ode15s(@(t,ysol) odefcn(t,ysol),tspan,y0,opts); % I used ode15s instead of ode23 because ode23()
% gives output when tspan is smaller like 0-300 s. Although I waited for
% the results too long, I couldn't get the output values when tspan=[0:1000}
VA = real(ysol(:,1));
VB = real(ysol(:,2));
TB = real(ysol(:,3));

% system equations
function [dVdt] = odefcn(t,ysol)
dVdt = zeros(3,1);
dVdt(1) = -0.6174*DA*10^(-4)*sqrt(19.62*ysol(1)); % dVA/dt = -a*b*DA*sqrt(2*g*VA/PA)
dVdt(2) = -0.002258*sqrt(19.62*ysol(2)) + 0.01 + 0.6174*DA*10^(-4)*sqrt(19.62*ysol(1)); % dVB/dt = -a*b*DB*sqrt(2*g*VB/PB) + 0.01 - dVA/dt
dVdt(3) = ((90 - ysol(3))*(0.6174*DA*10^(-4)*sqrt(19.62*ysol(1)))+(1/100)*(10-ysol(3)))/ysol(2); % dTB/dt = (dVin/dt)*(Tin-T)/V
% for the last equation I used this formula because the given formula is
% incorrect according to given DA value = 50 cm² Also, there should be
% derivative term to provide the units of both sides are equal
end

end

