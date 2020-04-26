function out = matrix(theta_vec)

N = length(theta_vec);
out = zeros(N);
J0 = 86;
J2 = 112;

for i = 1:N
    for j = 1:N
        out(i,j) = -J0 + J2*cos(2*(theta_vec(i)-theta_vec(j)));
    end
end

end