function [] = start()

disp("Authors: Mustafa Arda Aydın"); % display the names of authors

x0_1 = 20*rand(1,1) - 10; % creating random initial values between -10 and 10
x0_2 = 20*rand(1,1) - 10;
x0 = [x0_1,x0_2];

options = optimoptions("fminunc","Algorithm",'trust-region','SpecifyObjectiveGradient',true); % option for specifying gradient of the cost function 
[xopt,yopt,~,out] = fminunc(@ff_test,x0,options); % optimization using fminunc() command
fprintf("number of objective function calls for test function : %d \n",out.funcCount);
fprintf("optimum x1 value : %f \n",xopt(1));
fprintf("optimum x2 value : %f \n",xopt(2));
fprintf("optimum y value : %f \n",yopt);
% contour plot of the test function and optimum values
x1 = -10:0.5:10;
x2 = -10:0.5:10;
[X1,X2] = meshgrid(x1,x2);
f = (X1 + 2*X2 - 7).^2 + (2*X1 + X2 - 5).^2;

figure('Name','Contour Plot of Test Function');
hold on
contourf(X1,X2,f);
xlabel("x1");
ylabel("x2");
title("Contour Plot of Test Function (* means initial point,★ means the optimal point ) ");
scatter(x0_1,x0_2,'green','*');
scatter(xopt(1),xopt(2),'p');
hold off

theta0 = zeros(3,1);
options = optimoptions("fminunc","Algorithm",'trust-region','SpecifyObjectiveGradient',true);
[theta_opt,Jopt,~,out] = fminunc(@ff_logistic_reg ,theta0,options);
fprintf("number of objective function calls for logistic regression : %d \n",out.funcCount);
fprintf("optimum theta0 value : %f \n",theta_opt(1));
fprintf("optimum theta1 value : %f \n",theta_opt(2));
fprintf("optimum theta2 value : %f \n",theta_opt(3));
fprintf("optimum J value : %f \n",Jopt);

load('data.mat');
[prediction_matrix] = predict(X,theta_opt); % obtain our prediction matrix

true_prediction_matrix = Y == prediction_matrix; % compare our predictions with the given data
fprintf("\nnumber of correct prediction of admittance : %d \n",sum(true_prediction_matrix));

m = size(X,2); % number of samples

% plotting grades and decision boundary
figure('Name','Grades and the Decision Boundary');
hold on
gscatter(X(2,:),X(3,:),Y,'rb','ox',5,"off")
x1 = 25:0.02:m;
x2 = (-theta_opt(1) - theta_opt(2)*x1)./(theta_opt(3));   
plot(x1,x2);
legend('Not Admitted','Admitted','Decision Boundary')
hold off

title('Grades and the Decision Boundary');
xlabel('Grade for the first subject');
ylabel('Grade for the second subject');

end

