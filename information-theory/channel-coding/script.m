clear, clc

%% Variables
ZERO = zeros(3,1);
EYE = eye(7);
H = [0 0 0 1 1 1 1 ; 0 1 1 0 0 1 1 ; 1 0 1 0 1 0 1];

c1 =  [0 0 0 0 0 0 0];
c2 =  [0 0 0 1 1 1 1];
c3 =  [0 0 1 0 1 1 0];
c4 =  [0 0 1 1 0 0 1];
c5 =  [0 1 0 0 1 0 1];
c6 =  [0 1 0 1 0 1 0];
c7 =  [0 1 1 0 0 1 1];
c8 =  [0 1 1 1 1 0 0];
c9 =  [1 0 0 0 0 1 1];
c10 = [1 0 0 1 1 0 0];
c11 = [1 0 1 0 1 0 1];
c12 = [1 0 1 1 0 1 0];
c13 = [1 1 0 0 1 1 0];
c14 = [1 1 0 1 0 0 1];
c15 = [1 1 1 0 0 0 0];
c16 = [1 1 1 1 1 1 1];

C = [c1; c2; c3; c4; c5; c6; c7; c8; c9; c10; c11; c12; c13; c14; c15; c16];

%% Question 1-a
disp("Question 1-a)");
disp("Pu(p) = p^7 + 7*p^4*(1-p)^3 + 7*p^3*(1-p)^4");
disp("--------------------");

%% Question 1-b
disp("Question 1-b)");
disp("Pdc(p) = 7*p*(1-p)^6");
disp("--------------------");

%% Question 1-c
disp("Question 1-c)");
disp("Pdu(p) = 1 - (1-p)^7 - Pu - Pdc");
disp("--------------------");

%% Question 2-a
N = 10000;
p_vector1 = 10^(-3):10^(-3):9*10^(-3);
p_vector2 = 10^(-2):10^(-2):9*10^(-2);
p_vector3 = 10^(-1):10^(-1):5*10^(-1);

codewords = generate_codewords(C, N);
[Pu_hat_vector1, Pdc_hat_vector1, Pdu_hat_vector1, Pu_vector1, Pdc_vector1, Pdu_vector1] = estimate(codewords, p_vector1);
[Pu_hat_vector2, Pdc_hat_vector2, Pdu_hat_vector2, Pu_vector2, Pdc_vector2, Pdu_vector2] = estimate(codewords, p_vector2);
[Pu_hat_vector3, Pdc_hat_vector3, Pdu_hat_vector3, Pu_vector3, Pdc_vector3, Pdu_vector3] = estimate(codewords, p_vector3);

disp("Question 2-a)");
disp("generate_codewords(C, N)")
disp("transmit(c, p)")
disp("estimate(codewords, p_vector)")
disp("--------------------");

%% Question 2-b
subplot(431);
plot(p_vector1, Pu_hat_vector1, p_vector1, Pu_vector1);
xlabel('p');
legend('Pu-hat', 'Pu');
subplot(432);
plot(p_vector2, Pu_hat_vector2, p_vector2, Pu_vector2);
xlabel('p');
legend('Pu-hat', 'Pu');
subplot(433);
plot(p_vector3, Pu_hat_vector3, p_vector3, Pu_vector3);
xlabel('p');
legend('Pu-hat', 'Pu');

%% Question 2-c
subplot(434);
plot(p_vector1, Pdc_hat_vector1, p_vector1, Pdc_vector1);
xlabel('p');
legend('Pdc-hat', 'Pdc');
subplot(435);
plot(p_vector2, Pdc_hat_vector2, p_vector2, Pdc_vector2);
xlabel('p');
legend('Pdc-hat', 'Pdc');
subplot(436);
plot(p_vector3, Pdc_hat_vector3, p_vector3, Pdc_vector3);
xlabel('p');
legend('Pdc-hat', 'Pdc');

%% Question 2-d
subplot(437);
plot(p_vector1, Pdu_hat_vector1, p_vector1, Pdu_vector1);
xlabel('p');
legend('Pdu-hat', 'Pdu');
subplot(438);
plot(p_vector2, Pdu_hat_vector2, p_vector2, Pdu_vector2);
xlabel('p');
legend('Pdu-hat', 'Pdu');
subplot(439);
plot(p_vector3, Pdu_hat_vector3, p_vector3, Pdu_vector3);
xlabel('p');
legend('Pdu-hat', 'Pdu');

%% Question 2-e
subplot(4,3,10);
plot(p_vector1, Pu_hat_vector1+Pdu_hat_vector1, p_vector1, Pu_vector1+Pdu_vector1);
xlabel('p');
legend('Pe-hat', 'Pe');
subplot(4,3,11);
plot(p_vector2, Pu_hat_vector2+Pdu_hat_vector2, p_vector2, Pu_vector2+Pdu_vector2);
xlabel('p');
legend('Pe-hat', 'Pe');
subplot(4,3,12);
plot(p_vector3, Pu_hat_vector3+Pdu_hat_vector3, p_vector3, Pu_vector3+Pdu_vector3);
xlabel('p');
legend('Pe-hat', 'Pe');