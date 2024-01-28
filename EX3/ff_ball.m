function [minus_xend] = ff_ball(x)

v0x = x(1);
w = x(2);
[~,x,~,~] = sim_ball(v0x,w);
minus_xend = -x(end);
end

