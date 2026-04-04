% A3: Basic modulation by multiplication

% Student: Rupashri Das

clear; close all; clc;

%% Time vector
Fs = 20000;
T  = 0.1;
t  = 0:1/Fs:T-1/Fs;

%% Baseband and carrier
fm = 100;       % message frequency
fc = 2000;      % carrier frequency

m = sin(2*pi*fm*t);     % baseband signal
c = cos(2*pi*fc*t);     % carrier signal

%% Modulated signal
s = m .* c;

%% Plot baseband time domain
figure;
plot(t*1000,m);
grid on;

xlabel('Time [ms]');
ylabel('Amplitude');

title('Baseband Signal m(t)');

exportgraphics(gcf,'A3_baseband_time.png','Resolution',200);

%% Plot passband time domain
index = (t <= 0.005);

figure;
plot(t(index)*1000,s(index));
grid on;

xlabel('Time [ms]');
ylabel('Amplitude');

title('Passband Signal s(t)');

exportgraphics(gcf,'A3_passband_time.png','Resolution',200);

%% FFT baseband
N = length(m);
M = fft(m);

f = (0:N-1)*(Fs/N);
halfN = floor(N/2);

f_half = f(1:halfN);
mag_m = abs(M(1:halfN));

figure;
plot(f_half,mag_m);
grid on;

xlabel('Frequency [Hz]');
ylabel('Magnitude');

title('Baseband Spectrum');

xlim([0 1000]);

exportgraphics(gcf,'A3_baseband_spectrum.png','Resolution',200);

%% FFT modulated signal
S = fft(s);
mag_s = abs(S(1:halfN));

figure;
plot(f_half,mag_s);
grid on;

xlabel('Frequency [Hz]');
ylabel('Magnitude');

title('Modulated Signal Spectrum');

xlim([0 5000]);

exportgraphics(gcf,'A3_passband_spectrum.png','Resolution',200);
