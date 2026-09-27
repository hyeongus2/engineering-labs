function sequence = generate_binary(length,p)
%GENERATE_BINARY
sequence = '';

for i = 1:length
    x = rand;
    if x <= p
        sequence = [sequence '1'];
    else
        sequence = [sequence '0'];
    end
end

