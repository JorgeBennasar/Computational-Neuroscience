function out = network_2(N,iterations,m0,theta0,epsilon,c,J)

theta_vec = linspace(-pi/2,pi/2,N);
out = zeros(N,iterations);
out(:,1) = m0;
for i = 1:iterations-1
    h_vec = h_input_2(theta0,theta_vec,c,epsilon,J,out(:,i));
    out(:,i+1) = neuron_model(h_vec,out(:,i));
end

end