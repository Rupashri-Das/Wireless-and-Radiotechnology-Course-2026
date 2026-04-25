clc;
clear;
close all;

%% Parameters
fs = 1000; % Sampling frequency
t = 0:1/fs:1; % Time vector
f_c = 50; % Carrier frequency

SNR_values = [10 5 0 -5]; % SNR levels

%% Generate Binary Message Signal
message_signal = randi([0 1], 1, length(t));

%% ASK Modulation
carrier = cos(2*pi*f_c*t);
modulated_signal = message_signal .* carrier;

%% Plot Original Signals
figure;
subplot(3,1,1);
plot(t, message_signal);
title('Binary Message Signal');
xlabel('Time'); ylabel('Amplitude');

subplot(3,1,2);
plot(t, carrier);
title('Carrier Signal');
xlabel('Time'); ylabel('Amplitude');

subplot(3,1,3);
plot(t, modulated_signal);
title('ASK Modulated Signal');
xlabel('Time'); ylabel('Amplitude');

%% Loop for different SNR values
figure;

for i = 1:length(SNR_values)
    
    SNR = SNR_values(i);
    
    % Add Noise
    noisy_signal = awgn(modulated_signal, SNR, 'measured');
    
    % Demodulation (Envelope Detection)
    demodulated = abs(noisy_signal);
    
    % Thresholding
    threshold = 0.5;
    recovered_signal = demodulated > threshold;
    
    % Plotting
    subplot(length(SNR_values),3,(i-1)*3 + 1);
    plot(t, noisy_signal);
    title(['Received Signal (SNR = ' num2str(SNR) ' dB)']);
    
    subplot(length(SNR_values),3,(i-1)*3 + 2);
    plot(t, demodulated);
    title('Demodulated Signal');
    
    subplot(length(SNR_values),3,(i-1)*3 + 3);
    plot(t, recovered_signal);
    title('Recovered Binary Signal');
    
end

%% Save Figure
saveas(gcf, 'results.png');

disp('Experiment completed. Results saved as results.png');
