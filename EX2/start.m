function [] = start()

disp("Authors: Mustafa Arda Aydın"); % display the names of authors
x0 = 2*rand(2,1)-1; % creating random initial values between -1 and 1
[xopt,y,~,out] = fminsearch(@ff_test,x0) % optimization using fminsearch() command
fprintf(" number of objective function calls for test function : %d \n",out.funcCount);

% contour plot of the test function and optimum values
x1=[-1:0.02:1];
x2=[-1:0.02:1];
[X1,X2] = meshgrid(x1,x2);
f = X1.^2 + X2.^2 - cos(2.5*pi*X1) - cos(2.5*pi*X2) + 2;
figure("Name","Contour Plot of Test Function")
hold on
contour(X1,X2,f)
plot(x0(1),x0(2),'r*')
plot(xopt(1),xopt(2),'p')
xlabel("x1");
ylabel("x2");
title("Contour Plot of Test Function");
hold off

k0 = 10*rand(2,1); % creating random initial values between 0 and 10
[kopt,Q,~,out] = fminsearch(@ff_arm,k0) % optimization using fminsearch() command
fprintf(" number of objective function calls for robot arm problem : %d \n",out.funcCount);

[t,alpha,omega] = sim_arm(kopt(1),kopt(2)); % obtain position and velocity functions
alpha_par = matlabFunction(alpha); % convert symbolic expression to function handle
omega_par = matlabFunction(omega);

% plotting the position function 
figure("Name","Position Graph");
plot(t,alpha_par(t));
xlabel("t(s)");
ylabel("Position(rad)");
title("Position Graph");

% plotting the velocity function
figure("Name","Velocity Graph");
plot(t,omega_par(t));
xlabel("t(s)");
ylabel("Velocity(rad/s)");
title("Velocity Graph");

end

