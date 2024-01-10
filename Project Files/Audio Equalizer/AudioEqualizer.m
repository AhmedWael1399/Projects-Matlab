clc
clear
close all

delta = [1 zeros(1, 200)];
step = [1 ones(1, 200)];

% n sampling for impulse and step responses
n = 0:1:200;

% Audio file importing
global filename;

msg1 =( ' >>Audio Equalizer<< ' );
disp (msg1)
msg2 =( ' >>Please Select the audio file you want to edit<< ' );
disp (msg2)
[filename, pathname] = uigetfile({'*.wav';'*.*'},'File Selector');

% Getting filters' gains from the user
msg3 =( ' Enter the gain of each of the frequency bands ' );
disp (msg3)
g1 = input ( ' Gain of filter 0 - 170 Hz: ' );
g2 = input ( ' Gain of filter 170 - 310 Hz: ' );
g3 = input ( ' Gain of filter 310 - 600 Hz: ' );
g4 = input ( ' Gain of filter 600 - 1k Hz: ' );
g5 = input ( ' Gain of filter 1k - 3k Hz: ' );
g6 = input ( ' Gain of filter 3k - 6k Hz: ' );
g7 = input ( ' Gain of filter 6k - 12k Hz: ' );
g8 = input ( ' Gain of filter 12k - 14k Hz: ' );
g9 = input ( ' Gain of filter 14k - 16k Hz: ' );

% Read the audio file and get its sampling frequency
[y, F] = audioread(filename);

% Order of IIR = 4 and that of FIR = 40
N = 4;
Nf = 40;
% The value of normalized frequency
fn = F/2;

% Filter #1 (0 - 170 Hz)

% IIR
[numerator1, denomenator1] = butter(N, 170/fn);
[H1, w1] = freqz(numerator1, denomenator1);
magnitude1 = abs(H1);
phase1 = angle(H1) * (180/pi);
figure
plot(w1/pi, magnitude1);
title('IIR Magnitude Response 0 - 170 Hz');
figure
plot(w1/pi, phase1);
title('IIR Phase Response 0 - 170 Hz');
impulseResponse1 = filter(numerator1, denomenator1, delta);
figure
plot(n,impulseResponse1);
title('IIR Impulse Response 0 - 170 Hz');
stepResponse1 = filter(numerator1, denomenator1, step);
figure
plot(n,stepResponse1);
title('IIR Step Response 0 - 170 Hz');
figure
zplane(roots(numerator1), roots(denomenator1));
title('IIR Poles and Zeros 0 - 170 Hz');
% Part #1 of composite signal from IIR filter
y1 = (10.^((g1)/20))*filter(numerator1, denomenator1, y);

% FIR
coef1=fir1(Nf,170/fn);
[Hf1,wf1]=freqz(coef1,1);
figure
plot(wf1/pi, abs(Hf1));
title('FIR Magnitude Response 0 - 170 Hz');
figure
plot(wf1/pi, angle(Hf1)*(180/pi));
title('FIR Phase Response 0 - 170 Hz');
impulseResponsef1 = filter(coef1,1, delta);
figure
plot(n, impulseResponsef1);
title('FIR Impulse Response 0 - 170 Hz');
stepResponsef1 = filter(coef1,1, step);
figure
plot(n, stepResponsef1);
title('FIR Step Response 0 - 170 Hz');
figure
zplane(roots(coef1));
title('FIR Poles and Zeros 0 - 170 Hz');
% Part #1 of composite signal from FIR filter
yf1 = (10.^((g1)/20))*filter(coef1, 1, y);

% Filter #2 (170 - 310 Hz)

%IIR
wc2 = [170/fn 310/fn];
[numerator2, denomenator2] = butter(N, wc2);
[H2, w2] = freqz(numerator2, denomenator2);
magnitude2 = abs(H2);
phase2 = angle(H2) * (180/pi);
figure
plot(w2/pi, magnitude2);
title('IIR Magnitude Response 170 - 310 Hz');
figure
plot(w2/pi, phase2);
title('IIR Phase Response 170 - 310 Hz');
impulseResponse2 = filter(numerator2, denomenator2, delta);
figure
plot(n, impulseResponse2);
title('IIR Impulse Respponse 170 - 310 Hz');
stepResponse2 = filter(numerator2, denomenator2, step);
figure
plot(n, stepResponse2);
title('IIR Step Response 170 - 310 Hz');
figure
zplane(roots(numerator2), roots(denomenator2));
title('IIR Poles and Zeros 170 - 310 Hz');
% Part #2 of composite signal from IIR filter
y2 = (10.^((g2)/20))*filter(numerator2, denomenator2, y);

% FIR
coef2=fir1(Nf,wc2);
[Hf2,wf2]=freqz(coef2,1);
figure
plot(wf2/pi, abs(Hf2));
title('FIR Magnitude Response 170 - 310 Hz');
figure
plot(wf2/pi, angle(Hf2)*(180/pi));
title('FIR Phase Response 170 - 310 Hz');
impulseResponsef2 = filter(coef2,1, delta);
figure
plot(n, impulseResponsef2);
title('FIR Impulse Respponse 170 - 310 Hz');
stepResponsef2 = filter(coef2,1, step);
figure
plot(n, stepResponsef2);
title('FIR Step Response 170 - 310 Hz');
figure
zplane(roots(coef2));
title('FIR Poles and Zeros 170 - 310 Hz');
% Part #2 of composite signal from FIR filter
yf2 = (10.^((g2)/20))*filter(coef2, 1, y);

% Filter #3 (310 - 600 Hz)

% IIR
wc3 = [310/fn 600/fn];
[numerator3, denomenator3] = butter(N, wc3);
[H3, w3] = freqz(numerator3, denomenator3);
magnitude3 = abs(H3);
phase3 = angle(H3) * (180/pi);
figure
plot(w3/pi, magnitude3);
title('IIR Magnitude Response 310 - 600 Hz');
figure
plot(w3/pi, phase3);
title('IIR Phase Response 310 - 600 Hz');
impulseResponse3 = filter(numerator3, denomenator3, delta);
figure
plot(n, impulseResponse3);
title('IIR Impulse Response 310 - 600 Hz');
stepResponse3 = filter(numerator3, denomenator3, step);
figure
plot(n, stepResponse3);
title('IIR Step Response 310 - 600 Hz');
figure
zplane(roots(numerator3), roots(denomenator3));
title('IIR Poles and Zeros 310 - 600 Hz');
% Part #3 of composite signal from IIR filter
y3 = (10.^((g3)/20))*filter(numerator3, denomenator3, y);

% FIR
coef3=fir1(Nf,wc3);
[Hf3,wf3]=freqz(coef3,1);
figure
plot(wf3/pi, abs(Hf3));
title('FIR Magnitude Response 310 - 600 Hz');
figure
plot(wf3/pi, angle(Hf3)*(180/pi));
title('FIR Phase Response 310 - 600 Hz');
impulseResponsef3 = filter(coef3,1, delta);
figure
plot(n, impulseResponsef3);
title('FIR Impulse Response 310 - 600 Hz');
stepResponsef3 = filter(coef3,1, step);
figure
plot(n, stepResponsef3);
title('FIR Step Response 310 - 600 Hz');
figure
zplane(roots(coef3));
title('FIR Poles and Zeros 310 - 600 Hz');
% Part #3 of composite signal from FIR filter
yf3 = (10.^((g3)/20))*filter(coef3, 1, y);

% Filter #4 (600 - 1K Hz)

% IIR
wc4 = [600/fn 1000/fn];
[numerator4, denomenator4] = butter(N, wc4);
[H4, w4] = freqz(numerator4, denomenator4);
magnitude4 = abs(H4);
phase4 = angle(H4) * (180/pi);
figure
plot(w4/pi, magnitude4);
title('IIR Magnitude Response 600 - 1000 Hz');
figure
plot(w4/pi, phase4);
title('IIR Phase Response 600 - 1000 Hz');
impulseResponse4 = filter(numerator4, denomenator4, delta);
figure
plot(n, impulseResponse4);
title('IIR Impulse Response 600 - 1000 Hz');
stepResponse4 = filter(numerator4, denomenator4, step);
figure
plot(n, stepResponse4);
title('IIR Step Response 600 - 1000 Hz');
figure
zplane(roots(numerator4), roots(denomenator4));
title('IIR Poles and Zeros 600 - 1000 Hz');
% Part #4 of composite signal from IIR filter
y4 = (10.^((g4)/20))*filter(numerator4, denomenator4, y);

% FIR
coef4=fir1(Nf,wc4);
[Hf4,wf4]=freqz(coef4,1);
figure
plot(wf4/pi, abs(Hf4));
title('FIR Magnitude Response 600 - 1000 Hz');
figure
plot(wf4/pi, angle(Hf4)*(180/pi));
title('FIR Phase Response 600 - 1000 Hz');
impulseResponsef4 = filter(coef4,1, delta);
figure
plot(n, impulseResponsef4);
title('FIR Impulse Response 600 - 1000 Hz');
stepResponsef4 = filter(coef4,1, step);
figure
plot(n, stepResponsef4);
title('FIR Step Response 600 - 1000 Hz');
figure
zplane(roots(coef4));
title('FIR Poles and Zeros 600 - 1000 Hz');
% Part #4 of composite signal from FIR filter
yf4 = (10.^((g4)/20))*filter(coef4, 1, y);

% Filter #5 (1K - 3K Hz)

% IIR
wc5 = [1000/fn 3000/fn];
[numerator5, denomenator5] = butter(N, wc5);
[H5, w5] = freqz(numerator5, denomenator5);
magnitude5 = abs(H5);
phase5 = angle(H5) * (180/pi);
figure
plot(w5/pi, magnitude5);
title('IIR Magnitude Response 1000 - 3000 Hz');
figure
plot(w5/pi, phase5);
title('IIR Phase Response 1000 - 3000 Hz');
impulseResponse5 = filter(numerator5, denomenator5, delta);
figure
plot(n, impulseResponse5)
title('IIR Impulse Response 1000 - 3000 Hz');
stepResponse5 = filter(numerator5, denomenator5, step);
figure
plot(n, stepResponse5);
title('IIR Step Response 1000 - 3000 Hz');
figure
zplane(roots(numerator5), roots(denomenator5));
title('IIR Poles and Zeros 1000 - 3000 Hz');
% Part #5 of composite signal from IIR filter
y5 = (10.^((g5)/20))*filter(numerator5, denomenator5, y);

% FIR
coef5=fir1(Nf,wc5);
[Hf5,wf5]=freqz(coef5,1);
figure
plot(wf5/pi, abs(Hf5));
title('FIR Magnitude Response 1000 - 3000 Hz');
figure
plot(wf5/pi, angle(Hf5)*(180/pi));
title('FIR Phase Response 1000 - 3000 Hz');
impulseResponsef5 = filter(coef5,1, delta);
figure
plot(n, impulseResponsef5);
title('FIR Impulse Response 1000 - 3000 Hz');
stepResponsef5 = filter(coef5,1, step);
figure
plot(n, stepResponsef5);
title('FIR Step Response 1000 - 3000 Hz');
figure
zplane(roots(coef5));
title('FIR Poles and Zeros 1000 - 3000 Hz');
% Part #5 of composite signal from FIR filter
yf5 = (10.^((g5)/20))*filter(coef5, 1, y);

% Filter #6 (3K - 6K Hz)

% IIR
wc6 = [3000/fn 6000/fn];
[numerator6, denomenator6] = butter(N, wc6);
[H6, w6] = freqz(numerator6, denomenator6);
magnitude6 = abs(H6);
phase6 = angle(H6) * (180/pi);
figure
plot(w6/pi, magnitude6);
title('IIR Magnitude Response 3000 - 6000 Hz');
figure
plot(w6/pi, phase6);
title('IIR Phase Response 3000 - 6000 Hz');
impulseResponse6 = filter(numerator6, denomenator6, delta);
figure
plot(n, impulseResponse6);
title('IIR Impulse Response 3000 - 6000 Hz');
stepResponse6 = filter(numerator6, denomenator6, step);
figure
plot(n, stepResponse6);
title('IIR Step Response 3000 - 6000 Hz');
figure
zplane(roots(numerator6), roots(denomenator6));
title('IIR Poles and Zeros 3000 - 6000 Hz');
% Part #6 of composite signal from IIR filter
y6 = (10.^((g6)/20))*filter(numerator6, denomenator6, y);

% FIR
coef6=fir1(Nf,wc6);
[Hf6,wf6]=freqz(coef6,1);
figure
plot(wf6/pi, abs(Hf6));
title('FIR Magnitude Response 3000 - 6000 Hz');
figure
plot(wf6/pi, angle(Hf6)*(180/pi));
title('FIR Phase Response 3000 - 6000 Hz');
impulseResponsef6 = filter(coef6,1, delta);
figure
plot(n, impulseResponsef6);
title('FIR Impulse Response 3000 - 6000 Hz');
stepResponsef6 = filter(coef6,1, step);
figure
plot(n, stepResponsef6);
title('FIR Step Response 3000 - 6000 Hz');
figure
zplane(roots(coef6));
title('FIR Poles and Zeros 3000 - 6000 Hz');
% Part #6 of composite signal from FIR filter
yf6 = (10.^((g6)/20))*filter(coef6, 1, y);

%Filter #7 (6K - 12K Hz)

% IIR
wc7 = [6000/fn 12000/fn];
[numerator7, denomenator7] = butter(N, wc7);
[H7, w7] = freqz(numerator7, denomenator7);
magnitude7 = abs(H7);
phase7 = angle(H7) * (180/pi);
figure
plot(w7/pi, magnitude7);
title('IIR Magnitude Response 6000 - 12000 Hz');
figure
plot(w7/pi, phase7);
title('IIR Phase Response 6000 - 12000 Hz');
impulseResponse7 = filter(numerator7, denomenator7, delta);
figure
plot(n, impulseResponse7);
title('IIR Impulse Response 6000 - 12000 Hz');
stepResponse7 = filter(numerator7, denomenator7, step);
figure
plot(n, stepResponse7);
title('IIR Step Response 6000 - 12000 Hz');
figure
zplane(roots(numerator7), roots(denomenator7));
title('IIR Poles and Zeros 6000 - 12000 Hz');
% Part #7 of composite signal from IIR filter
y7 = (10.^((g7)/20))*filter(numerator7, denomenator7, y);

% FIR
coef7=fir1(Nf,wc7);
[Hf7,wf7]=freqz(coef7,1);
figure
plot(wf7/pi, abs(Hf7));
title('FIR Magnitude Response 6000 - 12000 Hz');
figure
plot(wf7/pi, angle(Hf7)*(180/pi));
title('FIR Phase Response 6000 - 12000 Hz');
impulseResponsef7 = filter(coef7,1, delta);
stepResponsef7 = filter(coef7,1, step);
figure
plot(n, impulseResponsef7);
title('FIR Impulse Response 6000 - 12000 Hz');
figure
plot(n, stepResponsef7);
title('FIR Step Response 6000 - 12000 Hz');
figure
zplane(roots(coef7));
title('FIR Poles and Zeros 6000 - 12000 Hz');
% Part #7 of composite signal from FIR filter
yf7 = (10.^((g7)/20))*filter(coef7, 1, y);

% Filter #8 (12K - 14K Hz)

% IIR
wc8 = [12000/fn 14000/fn];
[numerator8, denomenator8] = butter(N, wc8);
[H8, w8] = freqz(numerator8, denomenator8);
magnitude8 = abs(H8);
phase8 = angle(H8) * (180/pi);
figure
plot(w8/pi, magnitude8);
title('IIR Magnitude Response 12000 - 14000 Hz');
figure
plot(w8/pi, phase8);
title('IIR Phase Response 12000 - 14000 Hz');
impulseResponse8 = filter(numerator8, denomenator8, delta);
figure
plot(n, impulseResponse8);
title('IIR Impulse Response 12000 - 14000 Hz');
stepResponse8 = filter(numerator8, denomenator8, step);
figure
plot(n, stepResponse8);
title('IIR Step Response 12000 - 14000 Hz');
figure
zplane(roots(numerator8), roots(denomenator8));
title('IIR Poles and Zeros 12000 - 14000 Hz');
% Part #8 of composite signal from IIR filter
y8 = (10.^((g8)/20))*filter(numerator8, denomenator8, y);

% FIR
coef8=fir1(Nf,wc8);
[Hf8,wf8]=freqz(coef8,1);
figure
plot(wf8/pi, abs(Hf8));
title('FIR Magnitude Response 12000 - 14000 Hz');
figure
plot(wf8/pi, angle(Hf8)*(180/pi));
title('FIR Phase Response 12000 - 14000 Hz');
impulseResponsef8 = filter(coef8,1, delta);
stepResponsef8 = filter(coef8,1, step);
figure
plot(n, impulseResponsef8);
title('FIR Impulse Response 12000 - 14000 Hz');
figure
plot(n, stepResponsef8);
title('FIR Step Response 12000 - 14000 Hz');
figure
zplane(roots(coef8));
title('FIR Poles and Zeros 12000 - 14000 Hz');
% Part #8 of composite signal from FIR filter
yf8 = (10.^((g8)/20))*filter(coef8, 1, y);

%Filter #9 (14K - 16K Hz)

% IIR
wc9 = [14000/fn 16000/fn];
[numerator9, denomenator9] = butter(N, wc9);
[H9, w9] = freqz(numerator9, denomenator9);
magnitude9 = abs(H9);
phase9 = angle(H9) * (180/pi);
figure
plot(w9/pi, magnitude9);
title('IIR Magnitude Response 14000 - 16000 Hz');
figure
plot(w9/pi, phase9);
title('IIR Phase Response 14000 - 16000 Hz');
impulseResponse9 = filter(numerator9, denomenator9, delta);
figure
plot(n,impulseResponse9);
title('IIR Impulse Response 14000 - 16000 Hz');
stepResponse9 = filter(numerator9, denomenator9, step);
figure
plot(n, stepResponse9);
title('IIR Step Response 14000 - 16000 Hz');
figure
zplane(roots(numerator9), roots(denomenator9));
title('IIR Poles and Zeros 14000 - 16000 Hz');
% Part #9 of composite signal from IIR filter
y9 = (10.^((g9)/20))*filter(numerator9, denomenator9, y);

% FIR
coef9=fir1(Nf,wc9);
[Hf9,wf9]=freqz(coef9,1);
figure
plot(wf9/pi, abs(Hf9));
title('FIR Magnitude Response 14000 - 16000 Hz');
figure
plot(wf9/pi, angle(Hf9)*(180/pi));
title('FIR Phase Response 14000 - 16000 Hz');
impulseResponsef9 = filter(coef9,1, delta);
stepResponsef9 = filter(coef9,1, step);
figure
plot(n, impulseResponsef9);
title('FIR Impulse Response 14000 - 16000 Hz');
figure
plot(n, stepResponsef9);
title('FIR Step Response 14000 - 16000 Hz');
figure
zplane(roots(coef9));
title('FIR Poles and Zeros 14000 - 16000 Hz');
% Part #9 of composite signal from FIR filter
yf9 = (10.^((g9)/20))*filter(coef9, 1, y);

% IIR composite signal
yt = y1+y2+y3+y4+y5+y6+y7+y8+y9;

% FIR composite signal
yft = yf1+yf2+yf3+yf4+yf5+yf6+yf7+yf8+yf9;


disp(' ');
disp(' 1-FIR filter' );
disp(' 2-IIR filter' );
filterType = input (' Choose the type of filter: ');

% Composite signal representation in frequency and time domains
switch (filterType)
    case 1
        % FIR O/P in time domain
        figure
        plot(yf1);
        title('FIR 0 - 170 Hz time domain O/P');
        figure
        plot(yf2);
        title('FIR 170 - 310 Hz time domain O/P');
        figure
        plot(yf3);
        title('FIR 310 - 600 Hz time domain O/P');
        figure
        plot(yf4);
        title('FIR 600 - 1000 Hz time domain O/P');
        figure
        plot(yf5);
        title('FIR 1 - 3 KHz time domain O/P');
        figure
        plot(yf6);
        title('FIR 3 - 6 KHz time domain O/P');
        figure
        plot(yf7);
        title('FIR 6 - 12 KHz time domain O/P');
        figure
        plot(yf8);
        title('FIR 12 - 14 KHz time domain O/P');
        figure
        plot(yf9);
        title('FIR 14 - 16 KHz time domain O/P');
      
        % FIR O/P in frequency domain
        zf1 = abs(fftshift(fft(yf1)));
        f1 = linspace(-F/2, F/2, length(yf1));
        figure
        plot(f1,zf1);
        title('FIR 0 - 170 Hz frequency domain O/P');
        zf2 = abs(fftshift(fft(yf2)));
        f2 = linspace(-F/2, F/2, length(yf2));
        figure
        plot(f2,zf2);
        title('FIR 170 - 310 Hz frequency domain O/P');
        zf3 = abs(fftshift(fft(yf3)));
        f3 = linspace(-F/2, F/2, length(yf3));
        figure
        plot(f3,zf3);
        title('FIR 310 - 600 Hz frequency domain O/P');
        zf4 = abs(fftshift(fft(yf4)));
        f4 = linspace(-F/2, F/2, length(yf4));
        figure
        plot(f4,zf4);
        title('FIR 600 - 1000 Hz frequency domain O/P');
        zf5 = abs(fftshift(fft(yf5)));
        f5 = linspace(-F/2, F/2, length(yf5));
        figure
        plot(f5,zf5);
        title('FIR 1 - 3 KHz frequency domain O/P');
        zf6 = abs(fftshift(fft(yf6)));
        f6 = linspace(-F/2, F/2, length(yf6));
        figure
        plot(f6,zf6);
        title('FIR 3 - 6 KHz frequency domain O/P');
        zf7 = abs(fftshift(fft(yf7)));
        f7 = linspace(-F/2, F/2, length(yf7));
        figure
        plot(f7,zf7);
        title('FIR 6 - 12 KHz frequency domain O/P');
        zf8 = abs(fftshift(fft(yf8)));
        f8 = linspace(-F/2, F/2, length(yf8));
        figure
        plot(f8,zf8);
        title('FIR 12 - 14 KHz frequency domain O/P');
        zf9 = abs(fftshift(fft(yf9)));
        f9 = linspace(-F/2, F/2, length(yf9));
        figure
        plot(f9,zf9);
        title('FIR 14 - 16 KHz frequency domain O/P');
       
        sound(yft, F);
        figure
        plot(yft);
        title('Time Domain');
        
        % FIR Composite signal conversion to frequency domain
        zf = abs(fftshift(fft(yft)));
        nfft = length(yft);
        f = linspace(-F/2, F/2, length(yft));
        figure
        plot(f,zf);
        title('Frequency Domain');
        
    case 2
        % IIR O/P in time domain
        figure
        plot(y1);
        title('IIR 0 - 170 Hz time domain O/P');
        figure
        plot(y2);
        title('IIR 170 - 310 Hz time domain O/P');
        figure
        plot(y3);
        title('IIR 310 - 600 Hz time domain O/P');
        figure
        plot(y4);
        title('IIR 600 - 1000 Hz time domain O/P');
        figure
        plot(y5);
        title('IIR 1 - 3 KHz time domain O/P');
        figure
        plot(y6);
        title('IIR 3 - 6 KHz time domain O/P');
        figure
        plot(y7);
        title('IIR 6 - 12 KHz time domain O/P');
        figure
        plot(y8);
        title('IIR 12 - 14 KHz time domain O/P');
        figure
        plot(y9);
        title('IIR 14 - 16 KHz time domain O/P');

        % IIR O/P in frequency domain
        zf1 = abs(fftshift(fft(y1)));
        f1 = linspace(-F/2, F/2, length(y1));
        figure
        plot(f1,zf1);
        title('IIR 0 - 170 Hz frequency domain O/P');
        zf2 = abs(fftshift(fft(y2)));
        f2 = linspace(-F/2, F/2, length(y2));
        figure
        plot(f2,zf2);
        title('IIR 170 - 310 Hz frequency domain O/P');
        zf3 = abs(fftshift(fft(y3)));
        f3 = linspace(-F/2, F/2, length(y3));
        figure
        plot(f3,zf3);
        title('IIR 310 - 600 Hz frequency domain O/P');
        zf4 = abs(fftshift(fft(y4)));
        f4 = linspace(-F/2, F/2, length(y4));
        figure
        plot(f4,zf4);
        title('IIR 600 - 1000 Hz frequency domain O/P');
        zf5 = abs(fftshift(fft(y5)));
        f5 = linspace(-F/2, F/2, length(y5));
        figure
        plot(f5,zf5);
        title('IIR 1 - 3 KHz frequency domain O/P');
        zf6 = abs(fftshift(fft(y6)));
        f6 = linspace(-F/2, F/2, length(y6));
        figure
        plot(f6,zf6);
        title('IIR 3 - 6 KHz frequency domain O/P');
        zf7 = abs(fftshift(fft(y7)));
        f7 = linspace(-F/2, F/2, length(y7));
        figure
        plot(f7,zf7);
        title('IIR 6 - 12 KHz frequency domain O/P');
        zf8 = abs(fftshift(fft(y8)));
        f8 = linspace(-F/2, F/2, length(y8));
        figure
        plot(f8,zf8);
        title('IIR 12 - 14 KHz frequency domain O/P');
        zf9 = abs(fftshift(fft(y9)));
        f9 = linspace(-F/2, F/2, length(y9));
        figure
        plot(f9,zf9);
        title('IIR 14 - 16 KHz frequency domain O/P');
      
        sound(yt, F);
        figure
        plot(yt);
        title('Time Domain');
        
        % IIR Composite signal conversion to frequency domain
        zf = abs(fftshift(fft(yt)));
        nfft = length(yt);
        f = linspace(-F/2, F/2, length(yt));
        figure
        plot(f, zf);
        title('Frequency Domain');
end

X = sprintf('\n The sampling frequency of the track is %d.', F);
disp(X);


Fuser = input(' Enter the new sampling frequency: ');


% Modified composite signal representation in frequency and time domains
switch (filterType)
    case 1
        sound(yft, Fuser);
        figure
        plot(yft);
        title('Modified Composite Signal Time Domain Representation');
        % FIR Modified composite signal conversion to frequency domain
        zf = abs(fftshift(fft(yft)));
        nfft = length(yft);
        f = linspace(-Fuser/2, Fuser/2, length(yft));
        figure
        plot(f, zf);
        title('Modified Composite Signal Frequency Domain Representation');
        
    case 2
        sound(yt, Fuser);
        figure
        plot(yt);
        title('Modified Composite Signal Time Domain Representation');
        % IIR Modified composite signal conversion to frequency domain
        zf = abs(fftshift(fft(yt)));
        nfft = length(yt);
        f = linspace(-Fuser/2, Fuser/2, length(yt));
        figure
        plot(f, zf);
        title('Modified Composite Signal Frequency Domain Representation');
end