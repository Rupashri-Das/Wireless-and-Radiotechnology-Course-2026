% A2: Filtering a multi-tone signal

% Student: Rupashri Das

clear; close all; clc;

%% Create time vector
Fs = 10000;
T  = 0.2;
t  = 0:1/Fs:T-1/Fs;

%% Create signal
Vin = 10*sin(2*pi*500*t) ...
    + 5*sin(2*pi*600*t) ...
    + 3*sin(2*pi*700*t) ...
    + 5*sin(2*pi*800*t);

%% FFT BEFORE filtering
N = length(Vin);
X = fft(Vin);

f = (0:N-1)*(Fs/N);
halfN = floor(N/2);

f_half = f(1:halfN);
mag_before = abs(X(1:halfN));

figure;
plot(f_half,mag_before);
grid on;

xlabel('Frequency [Hz]');
ylabel('Magnitude');

title('Spectrum BEFORE filtering');

xlim([0 1200]);

exportgraphics(gcf,'A2_before.png','Resolution',200);

%% LPF to get ~500 Hz
cutoff = 550;
y500 = lowpass(Vin,cutoff,Fs);

X500 = fft(y500);
mag500 = abs(X500(1:halfN));

figure;
plot(f_half,mag500);
grid on;

xlabel('Frequency [Hz]');
ylabel('Magnitude');

title('After LPF (500 Hz)');

xlim([0 1200]);

exportgraphics(gcf,'A2_after_500.png','Resolution',200);

%% HPF to get ~800 Hz
cutoff = 750;
y800 = highpass(Vin,cutoff,Fs);

X800 = fft(y800);
mag800 = abs(X800(1:halfN));

figure;
plot(f_half,mag800);
grid on;

xlabel('Frequency [Hz]');
ylabel('Magnitude');

title('After HPF (800 Hz)');

xlim([0 1200]);

exportgraphics(gcf,'A2_after_800.png','Resolution',200);

%% BPF to get ~600 Hz
y600 = bandpass(Vin,[550 650],Fs);

X600 = fft(y600);
mag600 = abs(X600(1:halfN));

figure;
plot(f_half,mag600);
grid on;

xlabel('Frequency [Hz]');
ylabel('Magnitude');

title('After BPF (600 Hz)');

xlim([0 1200]);

exportgraphics(gcf,'A2_after_600.png','Resolution',200);

%% HPF to get 700 and 800 Hz
y78 = highpass(Vin,650,Fs);

X78 = fft(y78);
mag78 = abs(X78(1:halfN));

figure;
plot(f_half,mag78);
grid on;

xlabel('Frequency [Hz]');
ylabel('Magnitude');

title('After HPF (700 & 800 Hz)');

xlim([0 1200]);

exportgraphics(gcf,'A2_after_700_800.png','Resolution',200);
