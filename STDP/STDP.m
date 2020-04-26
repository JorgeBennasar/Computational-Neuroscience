%% STDP:

A_pos = 1; % positive gain
A_neg = 1; % negative gain
tau_pos = 10; % positive time constant (ms)
tau_neg = 20; % negative time constant (ms)
dt = 1; % time step (ms)
simulations = 60; % number of simulations
rep = 1000; % time between simulations (ms)
lag_range = -50:5:50; % range of time lags for simulation (ms)

dw_range = zeros(1,length(lag_range)); % to save weight changes
count = 0;

for lag = lag_range
    T =  rep*(simulations-1)+2*abs(lag)+1;
    pre_spikes = zeros(1,T);
    post_spikes = zeros(1,T);
    pre_spikes(lag+abs(lag)+1:rep:lag+abs(lag)+T) = 1; 
    post_spikes(abs(lag)+1:rep:T+abs(lag)) = 1; 
    x = zeros(1,T);
    y = zeros(1,T);
    count = count + 1;
    dw = 0;
    for t = 1:T
        x(t+1) = x(t) + dt/tau_pos*(-x(t) + pre_spikes(t));
        y(t+1) = y(t) + dt/tau_neg*(-y(t) + post_spikes(t)); 
        dw = dw + dt*(A_pos*x(t)*post_spikes(t) - ...
            A_neg*y(t)*pre_spikes(t));
    end
    dw_range(count) = dw;
end

figure;
plot(lag_range,dw_range,'b','LineWidth',2)
xlabel('pre spike time - post spike time')
ylabel('weight change')
    