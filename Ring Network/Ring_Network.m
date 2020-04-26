%% Ring Network:

%% Step 1:

N = 50;
theta_vec = linspace(-pi/2,pi/2,N);

theta0 = 0;
c = 3;
epsilon = 0.1;

h_vec = h_input(theta0,theta_vec,c,epsilon);
 
figure;
plot(theta_vec,h_vec,'Color',[0 0 0.7],'LineWidth',2);
axis tight;

T = 0;
beta = 0.1;
h_vec = linspace(-15,15,N);

g_vec = g_input(h_vec,beta,T);

figure;
plot(h_vec,g_vec,'Color',[0 0 0.7],'LineWidth',2);
axis tight;

%% Step 2:

iterations = 30;
m0 = zeros(1,N);
theta0 = 0;
epsilon = 0.9;
c = 1.5;

activity = network_1(N,iterations,m0,theta0,epsilon,c);

figure;
image(activity*1000);

c = 1.2;

activity = network_1(N,iterations,m0,theta0,epsilon,c);

figure;
image(activity*1000);

c = 4;

activity = network_1(N,iterations,m0,theta0,epsilon,c);

figure;
image(activity*1000);

%% Step 3:

J = matrix(theta_vec);

figure;
image(J*5);

iterations = 30;
m0 = zeros(1,N);
theta0 = 0;
epsilon = 0.9;
c = 1.5;

activity = network_2(N,iterations,m0,theta0,epsilon,c,J);

figure;
image(activity*200);

c = 1.2;

activity = network_2(N,iterations,m0,theta0,epsilon,c,J);

figure;
image(activity*200);

c = 4;

activity = network_2(N,iterations,m0,theta0,epsilon,c,J);

figure;
image(activity*200);

%% Step 4:

J = matrix(theta_vec);

theta0_1 = 0;
theta0_2 = 2*pi/3;
c = 100;
epsilon = 0.8;
m0 = zeros(1,N);
activity = zeros(N,530);

iterations = 30;
activity(:,1:30) = network_2(N,iterations,m0,theta0_1,epsilon,c,J);

m0 = activity(:,30);

iterations = 500;
activity(:,31:end) = network_2(N,iterations,m0,theta0_2,epsilon,c,J);

figure;
image(activity*200);

theta0 = 0;
c = 100;
epsilon = 0.8;
m0 = zeros(1,N);
activity = zeros(N,60);

iterations = 30;
activity(:,1:30) = network_2(N,iterations,m0,theta0,epsilon,c,J);

m0 = activity(:,30);
c = 0;

iterations = 30;
activity(:,31:end) = network_2(N,iterations,m0,theta0,epsilon,c,J);

figure;
image(activity*200);

theta0 = 0;
c = 100;
epsilon = 0.8;
m0 = zeros(1,N);
activity = zeros(N,60);
J = zeros(N);

iterations = 30;
activity(:,1:30) = network_2(N,iterations,m0,theta0,epsilon,c,J);

m0 = activity(:,30);
c = 0;

iterations = 30;
activity(:,31:end) = network_2(N,iterations,m0,theta0,epsilon,c,J);

figure;
image(activity*200);

