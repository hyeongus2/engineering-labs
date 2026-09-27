function test_roundtrip()
cases = {'', '0', '1', '000000', '0101010101', '011010011001'};
for c = 1:numel(cases)
    for w = [1 2 4 16]
        assert(strcmp(LZ77_decoder(LZ77_encoder(cases{c}, w)), cases{c}));
    end
end
disp('LZ77 round-trip cases passed');
end
