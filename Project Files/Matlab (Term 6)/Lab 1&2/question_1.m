nx =[-3:7];
x = zeros(length(nx),1);
x(4) = 2;
x(6) = 1;
x(7) = -1;
x(8) = 3;
figure
stem(nx,x);
title('x(n)');
y1 = nx+2;
figure
stem(y1,x);
title('Y1(n)');
y2 = nx-1;
figure
stem(y2,x);
title('Y2(n)');
y3 = -nx;
figure
stem(y3,x);
title('Y3(n)');
y4 = -nx+1;
figure
stem(y4,x);
title('Y4(n)');


