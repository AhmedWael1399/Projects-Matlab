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

% Frequency Modulation 
% NBFM Signal
kf = 1e+1*pi;
t = linspace(0, ty, interval);
deltaF = abs(kf*max(yfiltered));
m_int = kf.*cumsum(yfiltered);
nbfm = 2*maxAmplitude.*cos(2.*pi.*100000.*t + m_int); 
figure
plot(t, nbfm);
title('Modulted NBFM Signal in Time Domain');
zmnbfm = abs(fftshift(fft(nbfm)));
fmnbfm = linspace(-500000/2, 500000/2, length(nbfm));
figure
plot(fmnbfm, zmnbfm);
title('Modulated NBFM Signal in Frequency Domain');
% Frequency Demodulation
nbfm = diff(nbfm);
nbfmEnvelope = abs(hilbert(nbfm));
nbfmEnvelope = resample(nbfmEnvelope, F, 500000);
sound(nbfmEnvelope , F);