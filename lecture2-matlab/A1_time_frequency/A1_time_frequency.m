% A1: Time domain and frequency components (FFT)

% Student: Rupashri Das
% Student ID: YOUR_ID

clear; close all; clc;

%% 1) Create time vector
Fs = 10000;
T  = 0.05;
t  = 0:1/Fs:T-1/Fs;

%% 2) Create the signal
Vin = 10*sin(2*pi*500*t) ...
    + 5*sin(2*pi*600*t) ...
    + 3*sin(2*pi*700*t) ...
    + 5*sin(2*pi*800*t);

%% 3) Plot time domain
t_ms = t * 1000;
index = (t_ms <= 10);

figure;
plot(t_ms(index), Vin(index));
grid on;
xlabel('Time [ms]');
ylabel('Amplitude [mV]');
title('A1: Time Domain of Vin(t)');

exportgraphics(gcf,'A1_time.png','Resolution',200);

%% 4) FFT
N = length(Vin);
X = fft(Vin);

f = (0:N-1)*(Fs/N);

halfN = floor(N/2);

f_half = f(1:halfN);
X_half = X(1:halfN);

mag = abs(X_half);

figure;
plot(f_half,mag);
grid on;
xlabel('Frequency [Hz]');
ylabel('Magnitude');
title('A1: FFT Magnitude');

xlim([0 1200]);

exportgraphics(gcf,'A1_spectrum.png','Resolution',200);
