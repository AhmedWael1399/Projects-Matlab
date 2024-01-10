X1 = ones (1,2000);
Y1 = 1;
Y2 = zeros(1,1000);
Y3 = 1;
X2 = [ Y1 Y2 Y3 ];
X = (1/1000) * conv(X1,X2);
t = linspace(0,3,3001);
plot (t,X)
%axis ([-1 5 -0.01 0.01])