y1 = [1 -2.8 3.02 -1.468 0.27];
x1 = [0.03 -0.02 0.01];
f = tf(x1,y1);
figure
pzmap (f)
msg1 =( ' Roots of Numerator ' );
disp (msg1)
disp (roots(x1))
msg2 =( ' Roots of Denomenator ' );
disp (msg2)
disp (roots(y1))
in1 = [5 5*ones(1,40)];
out1 = filter(x1,y1,in1);
disp (out1)
Y = [-0.2 0.3 0 0];
xic = filtic(x1,y1,Y);
yic = filter(x1,y1,in1,xic);
disp(yic)