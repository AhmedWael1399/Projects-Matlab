nx4=[0 1 2 3];
nh4=[0 1 2 3];
x=[1 2 3 4];
h=[1 2 3 4];
M=length(x);
N=length(h);
ny4= 0:6;
y=zeros(1, M+N-1);
for u=1:N
    x1 = h(u)*[zeros(1,u-1) x zeros(1,M-u)];
    y = y+x1;
end
figure
stem (ny4,y);
title('Convolved Signal d');