clc
clear 
close all

%Read the audio file and get its sampling frequency
[y, F] = audioread('eric.wav');
ty = length(y)/F;
t = linspace(0, ty, length(y));
T=linspace(0, ty, length(y));
plot(t,y);
title('Original Signal in Time Domain');

% Input signal conversion to frequency domain 
z = fftshift(fft(y));
zf=abs(z);
f = linspace(-F/2, F/2, length(y));
plot(f,zf);
title('Original Signal in Frequency Domain');

%apply ideal LPF ,Searching for indices where f = -4000 and f = 4000
for i = 1:length(f)
    if (abs((f(i)+4.0000e+3)) < 0.01)
        index1 = i;
    end
    if (abs((f(i)-4.0000e+3)) < 0.01)
        index2 = i;
        break;
    end
end

%Generating a rect from index1 to index2
range = index2-index1;
step = [zeros(1, index1) ones(1, range) zeros(1, length(f)-index2)];
step = step.';

%Multiplying input signal by rect to eliminate frequencies other than 4k
yfilteredFreq = step.*z;
yfilteredFreqAbs = abs(step.*z);

figure
plot(f, yfilteredFreqAbs);
xlim([-4.5 4.5].*10^3)
title('Filtered Signal in Frequency Domain at 4KHZ  (ideal filter)');
 
%Converting the filtered signal to time domain to be modulated DSB-SC
yfiltered= ifft(ifftshift(yfilteredFreq));
yfiltered=yfiltered.';
figure
plot(T,yfiltered);
title('Filtered Signal in Time Domain at 4KHZ  (ideal filter)');
sound(yfiltered, F);
pause(9);

%Filtered signal resampling
maxAmplitude = max(yfiltered);
yfiltered = resample(yfiltered, 500000, F);
interval = length(yfiltered);

%DSB-SC Modulation 
t = linspace(0, ty, interval);
carrier=cos(2*pi*100000*t);
dsbsc =carrier.*yfiltered;
figure
plot(t, dsbsc);
title('Modulted DSB-SC Signal in Time Domain');
zm_sc=fftshift(fft(dsbsc));
zmsc = abs(fftshift(fft(dsbsc)));
fmsc = linspace(-500000/2, 500000/2, length(dsbsc));
figure
plot(fmsc, zmsc);
xlim([-150000 150000]);
ylim([0 1000]);
title('Modulated DSB-SC Signal in Frequency Domain');
xlim([-12 12].*10^4)

%remove USB to get SSB  using ideal filter
for i1 = 1:length(dsbsc)
    if (abs((fmsc(i1)+1.0000e+5)) < 0.1)
        idx1 = i1;
    end
    if (abs((fmsc(i1)-1.0000e+5)) < 0.1)
        idx2 = i1;
        break;
    end
end

%Generating a rect from idx1 to idx2
range1 = idx2-idx1;
step1 = [zeros(1, idx1) ones(1, range1) zeros(1, length(fmsc)-idx2)];
LSB_Frequency = step1.*zm_sc;
LSB_FAbs = abs(step1.*zm_sc);
figure
plot(fmsc, LSB_FAbs);
xlim([-150000 150000]);
ylim([0 1000]);
title('Obtain LSB in Frequency Domain using  from DSB-SC (ideal filter)');
xlim([-12 12].*10^4)
LSB_time = ifft(ifftshift(LSB_Frequency));

%demodulation of  SSB using coherent detector ideal filter
SSB_SC = LSB_time.*carrier;
SSB_SC = resample(SSB_SC,F,500000);
SSB_SC_ff= fftshift(fft(SSB_SC)) ;

%ideal lpf to get signal in frequency domain
SSB_SC_ff=SSB_SC_ff(1:end-1);  
SSB_SC_ff =SSB_SC_ff.*step';
SSB_SC_time =ifft(ifftshift(SSB_SC_ff)) ; 
signal_frequency_domain= fftshift(fft(SSB_SC_time));
figure
plot(T,SSB_SC_time);  
title('recieved LSB in Time Domain (ideal filter)');
figure;
plot(f,abs(signal_frequency_domain));  
title('recieved LSB in Freqency Domain (ideal filter)');
xlim([-4.5 4.5].*10^3)
sound(SSB_SC_time,F);
pause(9);

%remove USB to get SSB  using butter  filter
%Butterworth filter BPF to get LSB
fnorm = 500000/2;
BW_fitler=(500000*4000)/48000;
[numerator, denomenator] = butter(4,[100000 100000+BW_fitler]/fnorm,'bandpass');
Filter_DSB = filter(numerator, denomenator, dsbsc);
LSB_Butter = Filter_DSB.*carrier;
plot(fmsc,abs(fftshift(fft(Filter_DSB))));
title('Obtain LSB in Freqency Domain (Butter filter)');

%down sample butter filter 
LSB_down =resample(LSB_Butter,F,500000);
LSB_down =LSB_down(1:end-1);
lsb_freq=abs(fftshift(fft(LSB_down)));

%Butterworth filter LPF to get LSB after demodulation
[numerator, denomenator] = butter(4,4000/(F/2));
LSB_LPF_Time = filter(numerator, denomenator, LSB_down);
LSB_LPF_Freq = fftshift(fft(LSB_LPF_Time)); 
figure
plot(LSB_LPF_Time);  
title('recieved LSB in Time Domain  (butter filter)');

figure
plot(f,abs(LSB_LPF_Freq));
title('recieved LSB in Freqency Domain (butter filter)');
xlim([-4.5 4.5].*10^3)

%NOISE is added to signal
noised_signal_0  = awgn(LSB_time,0, 'measured');
noised_signal_10 = awgn(LSB_time,10,'measured');
noised_signal_30 = awgn(LSB_time,30,'measured');
noised_signal_0=noised_signal_0';
noised_signal_10=noised_signal_10';
noised_signal_30=noised_signal_30';
carrier=carrier.';
LSB0 = noised_signal_0.*carrier;
coherent0 = resample(LSB0,F,500000);
coherent0 = coherent0(1:end-1);
coherentFreq0 = fftshift(fft(coherent0));
coherentFilter0 = step.*coherentFreq0;
coherentTime0 = ifft(ifftshift(coherentFilter0)) ;
figure;
plot(T,coherentTime0);  
title('recieved LSB in Time Domain (ideal filter) with noise SNR=0');
figure;
plot(f,abs(coherentFilter0));
title('recieved LSB in Freq Domain (ideal filter) with noise SNR=0');
xlim([-4.5 4.5].*10^3)
sound(real(coherentTime0),F);
pause(9);
LSB10 = noised_signal_10.*carrier;
coherent10 = resample(LSB10,F,500000);
coherent10 = coherent10(1:end-1);
coherentFreq10 = fftshift(fft(coherent10));
coherentFilter10 = step.*coherentFreq10;
coherentTime10 = ifft(ifftshift(coherentFilter10)) ;
figure;
plot(T,coherentTime10);  
title('recieved LSB in Time Domain (ideal filter) with noise SNR=10');
figure;
plot(f,abs(coherentFilter10));
title('recieved LSB in Freq Domain (ideal filter) with noise SNR=10');
xlim([-4.5 4.5].*10^3)
sound(real(coherentTime10),F);
pause(9);
LSB30 = noised_signal_30.*carrier;
coherent30 = resample(LSB30,F,500000);
coherent30 = coherent30(1:end-1);
coherentFreq30 = fftshift(fft(coherent30));
coherentFilter30 = step.*coherentFreq30;
coherentTime30 = ifft(ifftshift(coherentFilter30)) ;
figure;
plot(T,coherentTime30);  
title('recieved LSB in Time Domain (ideal filter) with noise SNR=30');
figure;
plot(f,abs(coherentFilter30));
title('recieved LSB in Freq Domain (ideal filter) with noise SNR=30');
xlim([-4.5 4.5].*10^3)
sound(real(coherentTime30),F);
pause(9);
%OBTAIN  SSB-TC using ideal filter
A=2*max(LSB_time);
carrier=carrier.';
SSB_TC=(A+LSB_time).*carrier;
SSB_TC_freq =  fftshift(fft(SSB_TC));
step=step.';
step=resample(step,500000,F);
SSB_SCinFreqIdeal =  SSB_TC_freq.*step;
SSB_TC_time = ifft(ifftshift(SSB_SCinFreqIdeal));
envelopeSSBTC=abs(hilbert(real(SSB_TC_time)));

%down sample envelop detector
envelopeSSBTC=resample(envelopeSSBTC,F,500000);
envelopeSSBTC=envelopeSSBTC-mean(envelopeSSBTC);
figure;
plot(T,envelopeSSBTC(1:end-1));
title('Demodulated SSB-TC Signal in Time Domain');
zdtc = abs(fftshift(fft(envelopeSSBTC)));
fdtc = linspace(-F/2, F/2, length(envelopeSSBTC));
figure
plot(fdtc, zdtc);
xlim([-5000 5000]);
ylim([0 300]);
title('Demodulated SSB-TC Signal in Frequency Domain');
sound(real(envelopeSSBTC),F);