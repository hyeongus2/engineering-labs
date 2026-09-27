x = -5 : .1 : 5;
y = -5 : .1 : 5;
[X, Y] = meshgrid(x,y);
Z =  -0.5*X.^2 + X.*Y + Y.^2;
figure;  axis equal;
C = contour(X, Y, Z, 20);
clabel(C);
xlabel('x'); ylabel('y');
title('Problem 1a1 : The contour lines of the function z = -(1/2)x^2 + xy + y^2');
