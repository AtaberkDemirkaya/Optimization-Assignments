function [] = start()
% the program takes some time to output the results 
disp("Authors: Mustafa Arda Aydın"); % display the names of authors

% constraints for our test optimization problem
A = [];
b = [];
Aeq = [];
beq = [];
lb = [-5,-5];
ub = [5,5];

[xopt,yopt,~,out] = ga(@ff_test,2,A,b,Aeq,beq,lb,ub); % optimization using ga() command
fprintf("\nnumber of objective function calls for test function : %d \n",out.funccount);
fprintf("optimum x1 value : %f \n",xopt(1));
fprintf("optimum x2 value : %f \n",xopt(2));
fprintf("optimum y value : %f \n",yopt);

load('data.mat'); % loading data

% new upper and lower bounds for inverse problem
lb = [0.1,0.1];
ub = [3,3];

[xopt,yopt,~,out] = ga(@ff_inverse,2,A,b,Aeq,beq,lb,ub); % optimization using ga() command
fprintf("\nnumber of objective function calls for inverse analysis : %d \n",out.funccount);
fprintf("optimum b1 value : %f \n",xopt(1));
fprintf("optimum b2 value : %f \n",xopt(2));
fprintf("optimum fitness function value : %f \n",yopt);

% plotting the graph of x1 and x2 values for optimum b1 and b2
[t,x1sim,x2sim] = simulation(xopt(1),xopt(2));
figure('Name','the Graph of x1 and x2 Values for Optimum b1 and b2 ');
hold on
plot(t,x1sim);
plot(t,x2sim);
xlabel('t(sn)');
ylabel('x(m)');
title('the Graph of x1 and x2 Values for Optimum b1 and b2 ');
legend('x1','x2');
hold off

% plotting the graph of experimental x1 and x2 values according to data
figure('Name','the Graph of experimental x1 and x2 Values According to Data');
hold on
plot(t,x1);
plot(t,x2);
xlabel('t(sn)');
ylabel('x(m)');
title('the Graph of experimental x1 and x2 Values According to Data');
legend('experimental x1','experimental x2');
hold off

% plotting the graph of magnitude of difference between the experiment and
% the simulation
figure('Name','the Graph of the Absolute Magnitude of Difference Between the Experiment and the Simulation');
hold on
plot(t,abs(x1 - x1sim));
plot(t,abs(x2 - x2sim));
xlabel('t(sn)');
ylabel('x(m)');
title('Absolute Magnitude of Difference Between the Experiment and the Simulation');
legend('experimental x1','experimental x2');
hold off

end

