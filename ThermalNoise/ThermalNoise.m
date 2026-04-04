clc;
close all;
clear all;

%% ============================================================
%  THERMAL NOISE GENERATION AND ANALYSIS
%  Course: Wireless and Radio Technology 2026
%% ============================================================

% ---- PARAMETERS ----
B = 1e6;        % Bandwidth = 1 MHz
R = 100;        % Resistance = 100 ohms
T = 300;        % Temperature = 300 K (room temperature)
k = 1.38e-23;   % Boltzmann's constant (J/K)

% ---- DERIVED VALUES ----
n_samples   = 10000;                          % number of noise samples
time        = 0 : 1/B : (n_samples-1)/B;     % time vector (seconds)
noise_power = 4 * k * T * R * B;             % theoretical noise power (W)
noise_rms   = sqrt(noise_power);             % RMS voltage of noise

% ---- GENERATE THERMAL NOISE ----
thermal_noise = sqrt(4 * k * T * R * B) * randn(1, n_samples);

%% ============================================================
%  FIGURE 1 — Time Domain Plot
%% ============================================================
figure(1);
plot(time * 1e6, thermal_noise * 1e9);       % time in microseconds, noise in nanovolts
xlabel('Time (\mus)', 'FontSize', 12);
ylabel('Amplitude (nV)', 'FontSize', 12);
title('Thermal Noise — Time Domain', 'FontSize', 14, 'FontWeight', 'bold');
grid on;

%% ============================================================
%  FIGURE 2 — Power Spectral Density (PSD)
%% ============================================================
figure(2);
[psd, freq] = pwelch(thermal_noise, [], [], [], B);
semilogx(freq, 10*log10(psd), 'b', 'LineWidth', 1.5);
xlabel('Frequency (Hz)', 'FontSize', 12);
ylabel('Power/Frequency (dB/Hz)', 'FontSize', 12);
title('Power Spectral Density of Thermal Noise', 'FontSize', 14, 'FontWeight', 'bold');
grid on;

%% ============================================================
%  FIGURE 3 — Histogram of Noise Amplitude (Gaussian Check)
%% ============================================================
figure(3);
histogram(thermal_noise, 100, 'Normalization', 'pdf', 'FaceColor', 'cyan', 'EdgeColor', 'none');
xlabel('Amplitude (V)', 'FontSize', 12);
ylabel('Probability Density', 'FontSize', 12);
title('Amplitude Distribution of Thermal Noise (Gaussian)', 'FontSize', 14, 'FontWeight', 'bold');
grid on;

%% ============================================================
%  PRINT RESULTS TO COMMAND WINDOW
%% ============================================================
fprintf('\n========================================');
fprintf('\n   THERMAL NOISE ANALYSIS RESULTS');
fprintf('\n========================================');
fprintf('\n Input Parameters:');
fprintf('\n --------------------');
fprintf('\n Bandwidth         B = %.2e Hz', B);
fprintf('\n Resistance        R = %d Ohms', R);
fprintf('\n Temperature       T = %d K', T);
fprintf('\n Number of Samples   = %d', n_samples);
fprintf('\n');
fprintf('\n Output Parameters:');
fprintf('\n --------------------');
fprintf('\n Theoretical Noise Power (V^2) = %.4e W', noise_power);
fprintf('\n Theoretical Noise RMS (V)     = %.4e V', noise_rms);
fprintf('\n Simulated Noise Mean (V)      = %.4e V', mean(thermal_noise));
fprintf('\n Simulated Noise Std Dev (V)   = %.4e V', std(thermal_noise));
fprintf('\n Simulated Noise Power (V^2)   = %.4e W', mean(thermal_noise.^2));
fprintf('\n========================================\n');

%% ============================================================
%  EXPERIMENTATION — Effect of Temperature
%  Uncomment this section to compare different temperatures
%% ============================================================
% figure(4);
% temperatures = [200, 300, 400, 500];
% hold on;
% for i = 1:length(temperatures)
%     noise_temp = sqrt(4 * k * temperatures(i) * R * B) * randn(1, n_samples);
%     [psd_temp, freq_temp] = pwelch(noise_temp, [], [], [], B);
%     semilogx(freq_temp, 10*log10(psd_temp), 'LineWidth', 1.5, ...
%              'DisplayName', ['T = ' num2str(temperatures(i)) ' K']);
% end
% hold off;
% legend('show');
% xlabel('Frequency (Hz)');
% ylabel('PSD (dB/Hz)');
% title('PSD at Different Temperatures');
% grid on;
