function K = gaussianKernel(sigma,N)


gauss = @(x,y) exp(-(x.^2+y.^2)/(2*sigma^2));


c = (N+1)/2;
K = zeros(N);

for i=1:N
    for j=1:N
        K(i,j) = gauss(i-c,j-c);
    end
end
K = K./sum(K(:));