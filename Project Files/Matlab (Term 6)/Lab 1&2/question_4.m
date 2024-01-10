nx1 = 0:11;
x = ones(1,10);
y1a = [x 0 0];
y2a = (0.5)*[0 x 0];
y3a = 2*[0 0 x];
y = y1a+y2a+y3a;
figure
stem(nx1,y);
title('Graph a');


nx2 = 0:10;
x = ones(1,10);
y1b = [x 0];
y2b = (0.8)*[0 x];
yb = y1b+y2b;
figure
stem(nx2,yb);
title('Graph b');

nx3 = 0:11;
x = ones(1,10);
y1c = [0 x 0];
y2c = (0.8)*[0 0 x];
yc = y1c+y2c;
figure
stem(nx3,yc);
title('Graph c');

x = [1 1 1 1 1 1 1 2 1 1 1 1];
n = 0:11;
y = (1/5) * (x + [0 x(1:end-1)] + [0 0 x(1:end-2)] + [0 0 0 x(1:end-3)] + [0 0 0 0 x(1:end-4)]);
figure
stem(n,y);
title('Filtered Output');

