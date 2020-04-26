%% BCM rule:

x = [20,0;0,20];    % stimulus (1 and 2)
p = 0.5;            % probability of selection for stimulus 1 (1-p for 2)
T = 10000;          % total time of simulation (ms)
n = 1e-06;          % learning rate for weights
y_target = 10;      % output target
tau = 50;           % time constant for theta (ms)
dt = 1;             % time step (ms)

w = 0.5*ones(2,T);
theta = 5*ones(1,T);
y = zeros(1,T);

for t = 1:T-1      
    p = round(rand)+1;
    y(t) = w(:,t)'*x(:,p);
    w(:,t+1) = w(:,t) + dt*n*x(:,p)*y(t)*(y(t) - theta(t));
    w(:,t+1) = w(:,t+1).*(w(:,t+1) > 0);
    theta(t+1) = theta(t) + dt/tau*(-theta(t) + y(t)^2/y_target);
end

figure;
subplot(3,1,1); plot(w'); ylabel('w');
subplot(3,1,2); plot(theta); ylabel('\theta')
subplot(3,1,3); plot(y(1:t-1),'.'); ylabel('y'); xlabel('time')