t = linspace (0,50,50000) 
x = exp(-2*t);
figure;
plot (t,x)
X = fftshift(fft(x));
Xmag = abs (X);
Xphase = angle (X);
Fvec = linspace (-500,500,50000);
figure;
plot (Fvec,Xmag)
figure;
plot(Fvec,Xphase)