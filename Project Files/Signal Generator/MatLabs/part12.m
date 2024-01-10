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




