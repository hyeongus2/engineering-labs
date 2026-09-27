function H = entropy(p)
%ENTROPY
H = - p*log2(p) - (1-p)*log2(1-p);
end

