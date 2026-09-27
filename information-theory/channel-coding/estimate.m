function [Pu_hat_vector, Pdc_hat_vector, Pdu_hat_vector, Pu_vector, Pdc_vector, Pdu_vector] = estimate(codewords, p_vector)
%ESTIMATE
ZERO = zeros(3,1);
EYE = eye(7);
H = [0 0 0 1 1 1 1 ; 0 1 1 0 0 1 1 ; 1 0 1 0 1 0 1];

codewordsSize = size(codewords);
N = codewordsSize(1);
pSize = size(p_vector);
pNUM = pSize(2);

Pu_hat_vector = zeros(1, pNUM);
Pdc_hat_vector = zeros(1, pNUM);
Pdu_hat_vector = zeros(1, pNUM);

Pu_vector = zeros(1, pNUM);
Pdc_vector = zeros(1, pNUM);
Pdu_vector = zeros(1, pNUM);

for pi = 1:pNUM
    p = p_vector(pi);
    
    Pu_hat_count = 0;
    Pdc_hat_count = 0;
    Pdu_hat_count = 0;
    Pc_hat_count = 0;
    
    for m = 1:N
        c = codewords(m, :);
        r = transmit(c, p);
        
        Hr = time(H, r);
        for i = 1:7
            h = H(:, i);
            if isequal(Hr, h)
                e = EYE(i, :);
                c_hat = xor(r, e);
            end
        end
        
        if (isequal(Hr, ZERO)) & (~isequal(r, c))
            Pu_hat_count = Pu_hat_count + 1;
        elseif (~isequal(Hr, ZERO)) & (isequal(c_hat, c))
            Pdc_hat_count = Pdc_hat_count + 1;
        elseif (~isequal(Hr, ZERO)) & (~isequal(c_hat, c))
            Pdu_hat_count = Pdu_hat_count + 1;
        elseif (isequal(Hr, ZERO)) & (isequal(r, c))
            Pc_hat_count = Pc_hat_count + 1;
        end
    end
    
    Pu_hat = Pu_hat_count / N;
    Pdc_hat = Pdc_hat_count / N;
    Pdu_hat = Pdu_hat_count / N;
    
    Pu = p^7 + 7*p^4*(1-p)^3 + 7*p^3*(1-p)^4;
    Pdc = 7*p*(1-p)^6;
    Pdu = 1 - (1-p)^7 - Pu - Pdc;
    
    Pu_hat_vector(1, pi) = Pu_hat;
    Pdc_hat_vector(1, pi) = Pdc_hat;
    Pdu_hat_vector(1, pi) = Pdu_hat;
    
    Pu_vector(1, pi) = Pu;
    Pdc_vector(1, pi) = Pdc;
    Pdu_vector(1, pi) = Pdu;
end
end

