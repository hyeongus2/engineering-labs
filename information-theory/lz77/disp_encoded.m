function str_encoded = disp_encoded(encoded)
%DISP_ENCODED
eSize = size(encoded);
eLength = eSize(1);
str_encoded = '';

for ei = 1:eLength
    if encoded(ei, 1) == 0
        str_encoded = [str_encoded '0' int2str(encoded(ei, 2))];
    else
        str_encoded = [str_encoded '1' int2str(encoded(ei, 2)) int2str(encoded(ei, 3))];
    end
end
end

