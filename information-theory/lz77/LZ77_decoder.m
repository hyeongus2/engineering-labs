function decoded = LZ77_decoder(encoded)
%LZ77_DECODER
eSize = size(encoded);
eLength = eSize(1);
decoded = '';
i = 1;

for ei = 1:eLength
    if encoded(ei, 1) == 0
        decoded = [decoded int2str(encoded(ei, 2))];
        i = i + 1;
    else
        j = i - encoded(ei, 2);
        k = encoded(ei, 3);
        for l = 0:k-1
            decoded = [decoded decoded(j+l)];
        end
        i = i + k;
    end
end
end

