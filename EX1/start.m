function [] = start()

disp("Authors: Mustafa Arda Aydın"); % display the names of authors
[xopt,y,~,struct] = fminbnd(@ff_test,50,80) % optimization using fminbnd() command
fprintf(" number of objective function calls for test function : %d \n",struct.funcCount);

% plotting the test function and optimum values
x=[-100:0.1:100];
test_func = -cos(0.1*x).*exp(-(x./10-2*pi).^2) + 0.002*(x./10).^2;
figure('Name','Test Function');
hold on;
plot(x,test_func)
title("Test function");
xlabel("x");
ylabel("f(x)");
plot(xopt,ff_test(xopt),'r*')
hold off;

[DAopt,y,~,struct] = fminbnd(@ff_tanks,1,100) % optimization using fminbnd() command
[t,VA,VB,TB] = sim_tanks(DAopt); % obtain VA,VB and TB functions for optimum DA value
fprintf(" number of objective function calls for two tanks problem: %d \n",struct.funcCount);

% plotting the VA,VB and TB as the function of time
figure('Name','VA and VB Functions');
hold on;
plot(t,VA);
plot(t,VB);
title("the Volumes of A and B for optimum DA");
xlabel("t(s)");
ylabel("Volume(m³)");
legend(["VA" "VB"]);
hold off;
figure('Name','TB Function');
plot(t,TB);
title("the Temperature of B for optimum DA");
xlabel("t(s)");
ylabel("Temperature(C°)");
legend("TB");


end

