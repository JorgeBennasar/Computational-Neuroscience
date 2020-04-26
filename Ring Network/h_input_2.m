function out = h_input_2(theta0,theta_vec,c,epsilon,J,m_vec)

out = zeros(1,length(theta_vec));
for i = 1:length(theta_vec)
    h_inter = 0;
    for j = 1:length(theta_vec)
        h_inter = h_inter + J(i,j)*m_vec(j);
    end
    out(i) = h_inter + ...
        c*((1-epsilon) + epsilon*cos(2*(theta_vec(i)-theta0)));
end

end