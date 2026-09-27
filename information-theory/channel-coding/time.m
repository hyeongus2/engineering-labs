function Hx = time(H, x)
%TIMES
Hx = zeros(3, 1);
h = zeros(1, 7);
rowHr = 0;
for i = 1:3
    rowH = H(i, :);
    val = rowH * x';
    Hx(i) = rem(val, 2);
end

