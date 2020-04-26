%% Integrate and Fire:

% Euler's Method:

% Initial conditions and setup:

t = 1; % time step (ms)
tau = 10; % time constant (ms)
y = zeros(3,100); % initialize y (100 ms)
I = [9,11,15]; % current
y(:,1) = 0; % initial y value
R = 1; % resistance
y_threshold = 10; % threshold of the IaF model

% The loop to solve the DE:

for trial = 1:3
    for i=1:length(y)-1
        y(trial,i+1) = y(trial,i) + t/tau*(-y(trial,i) + R*I(trial));
        y(trial,i+1) = (y(trial,i+1)<y_threshold)*y(trial,i+1);
    end
end

figure;
plot(y(1,:),'Color',[0.7 0 0],'LineWidth',2);
hold on;
plot(y(2,:),'Color',[0 0.7 0],'LineWidth',2);
hold on;
plot(y(3,:),'Color',[0 0 0.7],'LineWidth',2);
