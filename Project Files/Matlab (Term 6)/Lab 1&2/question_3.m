n = 1:51;
x1 = sin(2*pi*0.1*n);
j=0;
for N1=1:10:41
j=j+1;
Etot1(j)=sum(x1(N1:N1+9).^2);
Pav1(j)=sum(x1(N1:N1+9).^2)/10; 
end;

n2 = 0:12;
x2 = sin(2*pi*0.1*n2);
Etot2 = sum(x2.^2);
Pav2 = sum(x2.^2)/13;

n3 = 0:1005;
x3 = sin(2*pi*0.1*n3);
Etot3 = sum(x3.^2);
Pav3 = sum(x3.^2)/1006;

