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




t = linspace(-0.5,0.5,100)
m = (sinc(10.^(-3) * t)).^2;
figure;
plot(t,m)
title ( ' m(t) ' );
M = fftshift(fft(m));
Fvec = linspace (-50,50,100);
figure;
plot(Fvec,M)
title ( ' M(w) ' );
Mmag = abs(M);
figure
plot (Fvec,Mmag);
title ( ' Magnitude of M(w) ' );
Mphase = angle (M);
figure;
plot (Fvec,Mphase);
title ( ' Phase of M(w) ' );
r = cos(2*pi*10.^5*t) .* m;
figure;
plot(t,r)
title( ' r(t) ' );
R = fftshift(fft(r));
figure;
plot(Fvec,R)
title( ' R(w) ' );
Rmag = abs(R);
figure;
plot(Fvec,Rmag)
title ( ' Magnitude of R(w) ' );
Rphase = angle(R);
figure;
plot(Fvec,Rphase);
title ( ' Phase of R(w) ' );





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





