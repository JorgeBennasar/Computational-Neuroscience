function out = neuron_model(h_vec,m_vec)

time_step = 1; 
tau = 5; 
beta = 0.1;
T = 0;
g_vec = g_input(h_vec,beta,T);

out = zeros(1,length(h_vec));
for i = 1:length(h_vec)
    out(i) = m_vec(i) + time_step/tau*(-m_vec(i) + g_vec(i));
end

end