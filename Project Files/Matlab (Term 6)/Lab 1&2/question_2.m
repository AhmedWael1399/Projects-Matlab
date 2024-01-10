n = [0:23];
X4 = sin (2*pi*4*(n/12));
X5 = sin (2*pi*5*(n/12));
X7 = sin (2*pi*7*(n/12));
X10 = sin (2*pi*10*(n/12));
X20 = sin (2*pi*20*(n/12));
figure
stem(n,X4);
title('X4(n)');
figure
stem(n,X5);
title('X5(n)');
figure
stem(n,X7);
title('X7(n)');
figure
stem(n,X10);
title('X10(n)');
figure
stem(n,X20);
title('X20(n)');