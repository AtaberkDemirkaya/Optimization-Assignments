function [return_value] = ff_tanks(DA)
[~,~,~,TB] = sim_tanks(DA); % just need TB function for given DA value
tb_max = max(TB); % find the maximum temperature of tank B
return_value = abs(50 - tb_max); % return the objective function value, objective function:|50- tb_max|
end

