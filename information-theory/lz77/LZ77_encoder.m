function encoded = LZ77_encoder(sequence, window)
%LZ77_ENCODER
encoded = zeros(0, 3);
length = strlength(sequence);
i = 1;

while i <= length
    match = false;
    max_k = 0;
    
    for j = max(i-window, 1):i-1
        k = 1;
        if sequence(j) == sequence(i)
            match = true;
            while i+k <= length && sequence(j+k) == sequence(i+k)
                k = k + 1;
            end
            if max_k < k
                max_k = k;
                max_j = j;
            end
        end
    end
    
    if match
        encoded = [encoded ; 1 (i-max_j) max_k];
    elseif isempty(encoded)
        encoded = [0 str2num(sequence(i)) 0];
    else
        encoded = [encoded ; 0 str2num(sequence(i)) 0];
    end
    
    if match
        i = i + max_k;
    else
        i = i + 1;
    end
end
end

