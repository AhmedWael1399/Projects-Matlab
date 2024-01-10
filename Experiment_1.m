clc
clear
close all

% Read the audio file and get its sampling frequency
[y, F] = audioread('eric.wav');

ty = length(y)/F;
t = linspace(0, ty, length(y));

% Input signal conversion to frequency domain (to apply ideal LPF)
z = fftshift(fft(y));
f = linspace(-F/2, F/2, length(y));

figure
plot(f, abs(z));
title('Original Signal in Frequency Domain');

% Searching for indices where f = -4000 and f = 4000
for i = 1:length(f)
    if (abs((f(i)+4.0000e+3)) < 0.01)
        index1 = i;
    end
    if (abs((f(i)-4.0000e+3)) < 0.01)
        index2 = i;
        break;
    end
end

% Generating a rect from index1 to index2
range = index2-index1;
step = [zeros(1, index1) ones(1, range) zeros(1, length(f)-index2)];
step = step.';

% Multiplying input signal by rect to eliminate frequencies other than 4k
yfilteredFreq = step.*z;
yfilteredFreqAbs = abs(step.*z);

figure
plot(f, yfilteredFreqAbs);
xlim([-15000 15000]);
title('Filtered Signal in Frequency Domain');

% Converting the filtered signal to time domain to be modulated
yfiltered = ifft(fftshift(yfilteredFreq));
figure
plot(t, yfiltered);
title('Filtered Signal in Time Domain');

% Signal after low pass filter
sound(yfiltered, F);
pause(9);

% Filtered signal resampling
maxAmplitude = max(yfiltered);
yfiltered = resample(yfiltered, 500000, F);
yfiltered = yfiltered.';
interval = length(yfiltered);

% DSB-SC Modulation and Demodulation
% Modulation
t = linspace(0, ty, interval);
dsbsc = 5*cos(2*pi*100000*t).*yfiltered;
figure
plot(t, dsbsc);
title('Modulted DSB-SC Signal in Time Domain');
zmsc = abs(fftshift(fft(dsbsc)));
fmsc = linspace(-500000/2, 500000/2, length(dsbsc));
figure
plot(fmsc, zmsc);
xlim([-150000 150000]);
ylim([0 300]);
title('Modulated DSB-SC Signal in Frequency Domain');

% Demodulation
dsbscEnvelope = abs(hilbert(dsbsc));
dsbscEnvelope = resample(dsbscEnvelope, F, 500000);
t = 0:1/F:length(dsbscEnvelope)/(F);
t = t(1:end-1);
figure
plot(t, dsbscEnvelope);
title('Demodulted DSB-SC Signal in Time Domain');
zdsc = abs(fftshift(fft(dsbscEnvelope)));
fdsc = linspace(-F/2, F/2, length(dsbscEnvelope));
figure
plot(fdsc, zdsc);
xlim([-8000 8000]);
ylim([0 1500]);
title('Demodulated DSB-SC Signal in Frequency Domain');
sound(dsbscEnvelope, F);
pause(9);

% Coherent detection
dsbsc0 = awgn(dsbsc,0);
dsbsc10 = awgn(dsbsc,10);
dsbsc30 = awgn(dsbsc,30);
t = linspace(0, ty, length(dsbsc));
vpe = dsbsc.*cos((2*pi*100000*t) + deg2rad(20));
vfe = dsbsc.*cos(2*pi*100100*t);
v0 = dsbsc0.*cos(2*pi*100000*t);
v10 = dsbsc10.*cos(2*pi*100000*t);
v30 = dsbsc30.*cos(2*pi*100000*t);
v0 = resample(v0, F, 500000);
v10 = resample(v10, F, 500000);
v30 = resample(v30, F, 500000);
vpe = resample(vpe, F, 500000);
vfe = resample(vfe, F, 500000);
zsc0 = fftshift(fft(v0));
zsc10 = fftshift(fft(v10));
zsc30 = fftshift(fft(v30));
zscpe = fftshift(fft(vpe));
zscfe = fftshift(fft(vfe));
fsc = linspace(-F/2, F/2, length(v0));
for i = 1:length(fsc)
    if (abs((fsc(i)+4.0000e+3)) < 0.01)
        index1 = i;
    end
    if (abs((fsc(i)-4.0000e+3)) < 0.01)
        index2 = i;
        break;
    end
end
range = index2-index1;
step = [zeros(1, index1) ones(1, range) zeros(1, length(fsc)-(index2))];
dsbscCoherent0 = step.*zsc0;
dsbscCoherent10 = step.*zsc10;
dsbscCoherent30 = step.*zsc30;
dsbscCoherentpe = step.*zscpe;
dsbscCoherentfe = step.*zscfe;
figure
plot(fsc, abs(dsbscCoherent0));
title('Demodulated DSB-SC Signal using Coherent Detection with SNR = 0 in Frequency Domain');
xlim([-8000 8000]);
figure
plot(fsc, abs(dsbscCoherent10));
title('Demodulated DSB-SC Signal using Coherent Detection with SNR = 10 in Frequency Domain');
xlim([-8000 8000]);
figure
plot(fsc, abs(dsbscCoherent30));
title('Demodulated DSB-SC Signal using Coherent Detection with SNR = 30 in Frequency Domain');
xlim([-8000 8000]);
figure
plot(fsc, abs(dsbscCoherentpe));
title('Demodulated DSB-SC Signal using Coherent Detection with Phase Error = 20 in Frequency Domain');
xlim([-8000 8000]);
figure
plot(fsc, abs(dsbscCoherentfe));
title('Demodulated DSB-SC Signal using Coherent Detection with Frequency Error = 100 HZ in Frequency Domain');
xlim([-8000 8000]);
dsbscCoherentTime0 = ifft(fftshift(dsbscCoherent0));
dsbscCoherentTime10 = ifft(fftshift(dsbscCoherent10));
dsbscCoherentTime30 = ifft(fftshift(dsbscCoherent30));
dsbscCoherentTimepe = ifft(fftshift(dsbscCoherentpe));
dsbscCoherentTimefe = ifft(fftshift(dsbscCoherentfe));
t = linspace(0, ty, length(dsbscCoherentTime0));
figure
plot(t, abs(dsbscCoherentTime0));
title('Demodulated DSB-SC Signal using Coherent Detection with SNR = 0 in Time Domain');
sound(abs(dsbscCoherentTime0), F);
pause(9);
figure
plot(t, abs(dsbscCoherentTime10));
title('Demodulated DSB-SC Signal using Coherent Detection with SNR = 10 in Time Domain');
sound(abs(dsbscCoherentTime10), F);
pause(9);
figure
plot(t, abs(dsbscCoherentTime30));
title('Demodulated DSB-SC Signal using Coherent Detection with SNR = 30 in Time Domain');
sound(abs(dsbscCoherentTime30), F);
pause(9);
figure
plot(t, abs(dsbscCoherentTimepe));
title('Demodulated DSB-SC Signal using Coherent Detection with Phase Error = 20 in Time Domain');
sound(abs(dsbscCoherentTimepe), F);
pause(9);
figure
plot(t, abs(dsbscCoherentTimefe));
title('Demodulated DSB-SC Signal using Coherent Detection with Frequency Error = 100 HZ in Time Domain');
sound(abs(dsbscCoherentTimefe), F);
pause(9);

% DSB-TC Modulation and Demodulation
% Modulation
t = linspace(0, ty, interval);
dsbtc = 2.*maxAmplitude.*(1+(0.5/maxAmplitude).*yfiltered).*cos(2.*pi.*100000.*t);
figure
plot(t, dsbtc);
title('Modulted DSB-TC Signal in Time Domain');
zmtc = abs(fftshift(fft(dsbtc)));
fmtc = linspace(-500000/2, 500000/2, length(dsbtc));
figure
plot(fmtc, zmtc);
xlim([-150000 150000]);
ylim([0 1000]);
title('Modulated DSB-TC Signal in Frequency Domain');

% Demodulation
dsbtcEnvelope = abs(hilbert(dsbtc));
dsbtcEnvelope = resample(dsbtcEnvelope, F, 500000);
dsbtcEnvelope=dsbtcEnvelope-mean(dsbtcEnvelope);
t = 0:1/F:length(dsbtcEnvelope)/(F);
t = t(1:end-1);
figure
plot(t, dsbtcEnvelope);
title('Demodulted DSB-TC Signal in Time Domain');
zdtc = abs(fftshift(fft(dsbtcEnvelope)));
fdtc = linspace(-F/2, F/2, length(dsbtcEnvelope));
figure
plot(fdtc, zdtc);
xlim([-8000 8000]);
ylim([0 1000]);
title('Demodulated DSB-TC Signal in Frequency Domain');
sound(dsbtcEnvelope, F);