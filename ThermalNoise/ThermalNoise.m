clc;
close all;
clear all;

% ---- PARAMETERS ----
B         = 1e6;
R         = 100;
T         = 300;
k         = 1.38e-23;
n_samples = 10000;

% ---- GENERATE DATA ----
time          = linspace(0, (n_samples-1)/B, n_samples);
thermal_noise = sqrt(4 * k * T * R * B) * randn(1, n_samples);

% ---- FFT FOR PSD (no toolbox needed) ----
N    = n_samples;
Y    = fft(thermal_noise);
P    = (abs(Y).^2) / N;
freq = linspace(0, B, N);

% ---- ALL 3 PLOTS IN ONE FIGURE ----
figure('Units','normalized','OuterPosition',[0 0 1 1]);

% --- Plot 1: Time Domain ---
subplot(3,1,1);
plot(time * 1e6, thermal_noise * 1e9, 'b');
xlabel('Time (\mus)');
ylabel('Amplitude (nV)');
title('Thermal Noise — Time Domain');
grid on;

% --- Plot 2: PSD ---
subplot(3,1,2);
plot(freq(1:N/2)/1e3, 10*log10(P(1:N/2)), 'r');
xlabel('Frequency (kHz)');
ylabel('Power (dB)');
title('Power Spectral Density');
grid on;

% --- Plot 3: Histogram ---
subplot(3,1,3);
histogram(thermal_noise, 100, 'FaceColor', 'cyan', 'EdgeColor', 'none');
xlabel('Amplitude (V)');
ylabel('Count');
title('Amplitude Distribution (Gaussian)');
grid on;

% ---- Force render ----
drawnow;
pause(1);

% ---- PRINT RESULTS ----
fprintf('\n========================================\n');
fprintf('   THERMAL NOISE ANALYSIS RESULTS\n');
fprintf('========================================\n');
fprintf(' Bandwidth          B = %.2e Hz\n', B);
fprintf(' Resistance         R = %d Ohms\n', R);
fprintf(' Temperature        T = %d K\n', T);
fprintf(' Theoretical RMS      = %.4e V\n', sqrt(4*k*T*R*B));
fprintf(' Simulated RMS        = %.4e V\n', std(thermal_noise));
fprintf(' Simulated Mean       = %.4e V\n', mean(thermal_noise));
fprintf('========================================\n');
