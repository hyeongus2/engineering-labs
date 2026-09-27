function r = transmit(c, p)
%TRANSMIT
r = zeros(1, 7);
for i = 1:7
    bit = c(i);
    x = rand;
    if x <= p
        r(i) = xor(bit, 1);
    else
        r(i) = bit;
    end
end

