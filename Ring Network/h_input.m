function out = h_input(theta0,theta_vec,c,epsilon)

out = zeros(1,length(theta_vec));
for i = 1:length(theta_vec)
    out(i) = c*((1-epsilon) + epsilon*cos(2*(theta_vec(i)-theta0)));
end

end