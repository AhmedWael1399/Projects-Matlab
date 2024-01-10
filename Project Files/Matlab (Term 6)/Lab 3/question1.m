num1 = [1 -2 2 -1];
denom1 = [1;0.5;0.2];
poles2 = poly([1 0.5 0.2]);
roots(num1);
msg1 =( ' Roots of Numerator ' );
disp (msg1)
disp(roots(num1));
msg2 =( ' Roots of Denomenator ' );
disp (msg2)
disp (denom1);
figure
zplane(roots(num1),denom1);
title ( 'Z-Plane Method');
f = tf(num1,poles2);
figure
pzmap (f)
x = [1 zeros(1,49)];
y = filter(num1,poles2,x);
disp (y)