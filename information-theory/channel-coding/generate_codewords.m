function codewords = generate_codewords(C, N)
%GENERATE_CODEWORDS
codewords = zeros(N, 7);
for i = 1:N
    r = randi([1, 16]);
    codewords(i, :) = C(r, :);
end

