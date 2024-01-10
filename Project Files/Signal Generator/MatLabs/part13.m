close all
clear , clc
nneg = -10:-1;
npos = 1:10;
Fnneg = (1./(pi*(1+(2*1i*nneg)))).*(1-exp(-pi*(1+1i*2*nneg)));
Fnpos = (1./(pi*(1+(2*1i*npos)))).*(1-exp(-pi*(1+1i*2*npos)));
F0 = 0.305;
Fn = [Fnneg F0 Fnpos];
n = [nneg 0 npos];
figure;
stem(n, abs(Fn))
title( ' Magnitude Spectrum ' );
figure;
stem(n, angle(Fn))
title ( ' Phase Spectrum ' );