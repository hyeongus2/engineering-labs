clear, clc

%% Question 1
disp('Question 1)')
disp('LZ77_encoder(sequence, window)');
disp('LZ77_decoder(encoded)');
disp('--------------------');

%% Question 2
sequence = '1001001000110101';
window = 4;
encoded = LZ77_encoder(sequence, window);
str_encoded = disp_encoded(encoded);

disp('Question 2)');
fprintf('sequence = %s\n', sequence);
fprintf('encoded = %s\n', str_encoded);
disp('--------------------');

%% Question 3
decoded = LZ77_decoder(encoded);

disp('Question 3)');
fprintf('decoded = %s\n', decoded);
if sequence == decoded
    disp('sequence and decoded are same');
else
    disp('sequence and decoded are different');
end
disp('--------------------');

%% Question 4
length = 10000;
p = 0.1;
sequence = generate_binary(length,p);
window = 100;
encoded = LZ77_encoder(sequence, window);
str_encoded = disp_encoded(encoded);
decoded = LZ77_decoder(encoded);

disp('Question 4)');
fprintf('sequence = %s\n', sequence);
fprintf('encoded = %s\n', str_encoded);
fprintf('decoded = %s\n', decoded);
if sequence == decoded
    disp('sequence and decoded are same');
else
    disp('sequence and decoded are different');
end
disp('--------------------');

%% Question 5
Rc = compression_rate(encoded, length);

disp('Question 5)');
fprintf('Rc = %f\n', Rc);
disp('--------------------');

%% Question 6
length = 10000;
window = 100;
p_vector = 0.02:0.02:0.2;
Rc_vector = zeros(1, 10);
H_vector = zeros(1, 10);

for i = 1:10
    p = p_vector(i);
    sequence = generate_binary(length,p);
    encoded = LZ77_encoder(sequence, window);
    decoded = LZ77_decoder(encoded);
    Rc = compression_rate(encoded, length);
    Rc_vector(i) = Rc;
    H = entropy(p);
    H_vector(i) = H;
end

plot(p_vector, Rc_vector, p_vector, H_vector)
xlabel('p')
title('Question 6)')
legend('Rc(p)', 'H(p)')
