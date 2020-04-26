function out = network_1(N,iterations,m0,theta0,epsilon,c)

theta_vec = linspace(-pi/2,pi/2,N);
h_vec = h_input(theta0,theta_vec,c,epsilon);
out = zeros(N,iterations);
out(:,1) = m0;
for i = 1:iterations-1
    out(:,i+1) = neuron_model(h_vec,out(:,i));
end

end