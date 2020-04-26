function out = g_input(h_vec,beta,T)

out = (h_vec > T).*(1 + (beta*(h_vec - T) - 1).*(h_vec <= T + 1/beta));

end