function [c,ceq] = nonlcon_ball(x)

v0x = x(1);
w = x(2);
% constraint matrices
A = [1;-1];
B = [-6;4];
[~,~,~,x50] = sim_ball(v0x,w); % obtain x50 value for constraint problem

c = A*x50 + B;
ceq = [];
end

