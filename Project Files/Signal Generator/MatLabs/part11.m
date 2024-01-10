t = linspace(-1, 3, 2000);
X = exp(-1/5 * abs(t));
subplot (2,2,1);
plot (t,X);
title ( ' Y(t) ');
subplot (2,2,2);
plot (t/3,X);
title ( ' Y1(t) ');
subplot (2,2,3);
plot (t - 2,X);
title ( ' Y2(t) ');
subplot (2,2,4);
plot ((-t/2) + 2,X);
title ( ' Y3(t) ');





