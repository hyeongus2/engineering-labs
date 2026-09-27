function Rc = compression_rate(encoded, length)
%COMPRESSION_RATE
eSize = size(encoded);
eLength = eSize(1);
code_length = 0;

for ei = 1:eLength
    if encoded(ei, 1) == 0
        code_length = code_length + 2;
    else
        code_length = code_length + 1 + ceil(log2(encoded(ei, 2))) + ceil(log2(encoded(ei, 3)));
    end
end

Rc = code_length / length;
end

