function [] = start()

disp("Authors: Mustafa Arda Aydın"); % display the names of authors

% constraints for our optimization problem
A = [];
b = [];
Aeq = [];
beq = [];
lb = [1,1];
ub = [Inf,Inf];
nonlcon = @nonlcon_test;
x0 = zeros(1,2);


x0_1 = 3*rand(1,1) + 1; % creating random initial values between 1 and 4
x0_2 = 3*rand(1,1) + 1;
x0 = [x0_1,x0_2];

[xopt,yopt,~,out] = fmincon(@ff_test,x0,A,b,Aeq,beq,lb,ub,nonlcon); % optimization using fmincon() command
fprintf("number of objective function calls for test function : %d \n",out.funcCount);
fprintf("optimum x1 value : %f \n",xopt(1));
fprintf("optimum x2 value : %f \n",xopt(2));
fprintf("optimum y value : %f \n",yopt);
% contour plot of the test function and optimum values
x1=[1:0.02:4];
x2=[1:0.02:4];
[X1,X2] = meshgrid(x1,x2);
f = sin(sqrt(X1.^2 + X2.^2))./(sqrt(X1.^2 + X2.^2));

figure("Name","Contour Plot of Test Function")
hold on
contourf(X1,X2,f)
plot(x0(1),x0(2),'r*')
plot(xopt(1),xopt(2),'p')
xlabel("x1");
ylabel("x2");
title("Contour Plot of Test Function (* means initial point,★ means the optimal point)  ");
hold off

lb = [-10,-20];
ub = [10,20];
nonlcon = @nonlcon_ball;

x0_1 = 20*rand(1,1) - 10; % creating random initial values between -10 and 10
x0_2 = 40*rand(1,1) - 20; % creating random initial values between -20 and 20
x0_new = [x0_1,x0_2];


[x_newopt,y_newopt,~,out] = fmincon(@ff_ball,x0_new,A,b,Aeq,beq,lb,ub,nonlcon); % optimization using fmincon() command

fprintf(" number of objective function calls for ball problem : %d \n",out.funcCount);
fprintf(" optimum v0x value : %f \n",x_newopt(1));
fprintf(" optimum omega value : %f \n",x_newopt(2));

[topt,xopt,yopt,x50_opt] = sim_ball(x_newopt(1),x_newopt(2)); % obtain the optimized x,y,t, and x50 values
fprintf(" optimum xend value : %f \n",xopt(end));
fprintf(" optimum x50 value : %f \n",x50_opt);

% [t,x,y,x50] = sim_ball(5,10);
% [t(end),x(end),y(end),x50]
% plotting ball trajectory
figure('Name','Ball Trajectory for optimum values');
plot(xopt,yopt);
xlabel("x");
ylabel("y");
title('Ball Trajectory');
grid
end

