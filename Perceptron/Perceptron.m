%% Perceptron:

% 1.1:

bias = 1;
alpha = 1;
iterations = 10;

x = transpose([0 0; 0 1; 1 0; 1 1]);

y_target = [0 1 1 1]; 
[~,error] = train_perceptron(x,y_target,bias,alpha,iterations);

figure;
plot(error); % CONVERGES (as expected)

y_target = [0 1 1 0]; 
[~,error] = train_perceptron(x,y_target,bias,alpha,iterations);

figure;
plot(error); % DOESN'T CONVERGE (as expected)

% 1.2:

bias = 1;
alpha = 1;
iterations = 50;

p = 50;
n = 100;

x = round(rand(n,p));
y_target = round(rand(1,p));
[~,error] = train_perceptron(x,y_target,bias,alpha,iterations);

figure;
plot(error); % CONVERGES (p < n assures linear independence)

p = 200;
n = 100;

x = round(rand(n,p));
y_target = round(rand(1,p));
[~,error] = train_perceptron(x,y_target,bias,alpha,iterations);

figure;
plot(error); % DOESN'T CONVERGE (p > n doesn't assure linear independence)

% The larger p compared to n, the smaller the probability of randomly 
% selecting a linearly separable dataset.