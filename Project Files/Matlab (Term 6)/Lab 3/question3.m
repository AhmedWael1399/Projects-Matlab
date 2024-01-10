num1 = [0.74 -2.544 2.5126];
denom1 = [1 0 0.64];
roots(num1);
msg1 =( ' Roots of Numerator ' );
disp (msg1)
disp(roots(num1));
msg2 =( ' Roots of Denomenator ' );
disp (msg2)
disp (denom1);
f = tf(num1,denom1);
figure
pzmap (f)
delta1 = [1 zeros(1,49)];
impresponse = filter(num1,denom1,delta1);
disp(impresponse)
n = 0:1:49;
in1 = (2*(0.8).^n)-(2*(0.3).^n);
y = filter(num1,denom1,in1);
disp (y)
syms Z n
in1 = ztrans((2*(0.8).^n)-(2*(0.3).^n));
msg3 = (' X(z)');
disp(msg3);
disp(in1);
out1 = in1*((0.74*(Z^2))-(2.544*Z)+2.5216)/((Z^2)+0.64);
msg4 = (' H(z)');
disp(msg4);
disp(out1);
out1num = [0.74 2.544 2.5216 0];
out1denom = [1 -1.1 0.88 -0.704 0.1536];
zplane(roots(out1num), roots(out1denom));
