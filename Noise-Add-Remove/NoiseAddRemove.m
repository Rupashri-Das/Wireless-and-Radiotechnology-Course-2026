clc;
close all;
clear all;

%% ============================================================
%  ADDING AND REMOVING NOISE FROM A SIGNAL
%  Course: Wireless and Radio Technology 2026
%% ============================================================

% ---- PARAMETERS ----
fs          = 1000;   % Sampling frequency (Hz)
t           = 0:1/fs:1;  % Time vector (0 to 1 second)
f_signal    = 5;      % Signal frequency (Hz)
amplitude   = 1;      % Signal amplitude
noise_level = 0.5;    % Standard deviation of Gaussian noise
cutoff_freq = 10;     % Low-pass filter cutoff frequency (Hz)
filter_order = 4;     % Butterworth filter order

%% ============================================================
%  STEP 1: Generate Original Sinusoidal Signal
%% ============================================================
original_signal = amplitude * sin(2 * pi * f_signal * t);

%% ============================================================
%  STEP 2: Add Gaussian White Noise
%% ============================================================
noise        = noise_level * randn(size(t));
noisy_signal = original_signal + noise;

% Calculate SNR before filtering
signal_power = mean(original_signal.^2);
noise_power  = mean(noise.^2);
SNR_before   = 10 * log10(signal_power / noise_power);

%% ============================================================
%  STEP 3: Remove Noise Using Low-Pass Butterworth Filter
%% ============================================================
% Normalize cutoff frequency (must be between 0 and 1, where 1 = Nyquist)
Wn = cutoff_freq / (fs/2);

% Design Butterworth low-pass filter
[b, a] = butter(filter_order, Wn, 'low');

% Apply filter using filtfilt (zero-phase, no time delay distortion)
filtered_signal = filtfilt(b, a, noisy_signal);

% Calculate SNR after filtering
noise_after      = filtered_signal - original_signal;
noise_power_after = mean(noise_after.^2);
SNR_after        = 10 * log10(signal_power / noise_power_after);

%% ============================================================
%  STEP 4: Plot Everything in ONE Figure (MATLAB Online fix)
%% ============================================================
figure('Units','normalized','OuterPosition',[0 0 1 1]);

% --- Plot 1: Original Signal ---
subplot(4,1,1);
plot(t, original_signal, 'b', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Sinusoidal Signal (5 Hz)');
grid on;
ylim([-1.5 1.5]);

% --- Plot 2: Noisy Signal ---
subplot(4,1,2);
plot(t, noisy_signal, 'r', 'LineWidth', 0.8);
xlabel('Time (s)');
ylabel('Amplitude');
title(['Noisy Signal (Gaussian Noise added, SNR = ' num2str(round(SNR_before,1)) ' dB)']);
grid on;

% --- Plot 3: Filtered Signal vs Original ---
subplot(4,1,3);
plot(t, noisy_signal, 'r', 'LineWidth', 0.5, 'DisplayName', 'Noisy');
hold on;
plot(t, filtered_signal, 'b', 'LineWidth', 2, 'DisplayName', 'Filtered');
plot(t, original_signal, 'g--', 'LineWidth', 1.5, 'DisplayName', 'Original');
hold off;
xlabel('Time (s)');
ylabel('Amplitude');
title(['Filtered Signal vs Original (Cutoff = ' num2str(cutoff_freq) ' Hz, SNR = ' num2str(round(SNR_after,1)) ' dB)']);
legend('Location', 'best');
grid on;

% --- Plot 4: Frequency Spectrum Comparison ---
subplot(4,1,4);
N      = length(t);
f_axis = linspace(0, fs/2, N/2);

% FFT of all three signals
Y_original = abs(fft(original_signal))/N;
Y_noisy    = abs(fft(noisy_signal))/N;
Y_filtered = abs(fft(filtered_signal))/N;

plot(f_axis, 2*Y_noisy(1:N/2),    'r', 'LineWidth', 1,   'DisplayName', 'Noisy');
hold on;
plot(f_axis, 2*Y_filtered(1:N/2), 'b', 'LineWidth', 1.5, 'DisplayName', 'Filtered');
plot(f_axis, 2*Y_original(1:N/2), 'g--','LineWidth', 2,  'DisplayName', 'Original');
hold off;
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Frequency Spectrum Comparison');
legend('Location', 'best');
xlim([0 100]);
grid on;

drawnow;
pause(1);

%% ============================================================
%  STEP 5: Print Results
%% ============================================================
fprintf('\n========================================\n');
fprintf('   NOISE ADDITION & REMOVAL RESULTS\n');
fprintf('========================================\n');
fprintf(' Input Parameters:\n');
fprintf(' --------------------\n');
fprintf('  Sampling Frequency  fs = %d Hz\n',    fs);
fprintf('  Signal Frequency     f = %d Hz\n',    f_signal);
fprintf('  Signal Amplitude     A = %.1f\n',     amplitude);
fprintf('  Noise Level (std)      = %.2f\n',     noise_level);
fprintf('  Filter Type            = Butterworth Low-Pass\n');
fprintf('  Filter Order           = %d\n',       filter_order);
fprintf('  Cutoff Frequency       = %d Hz\n',    cutoff_freq);
fprintf('\n Output Results:\n');
fprintf(' --------------------\n');
fprintf('  SNR Before Filtering = %.2f dB\n',    SNR_before);
fprintf('  SNR After  Filtering = %.2f dB\n',    SNR_after);
fprintf('  SNR Improvement      = %.2f dB\n',    SNR_after - SNR_before);
fprintf('========================================\n');
