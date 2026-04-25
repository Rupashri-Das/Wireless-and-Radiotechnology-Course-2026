# MATLAB Lab Experiment: Impact of SNR on Communication System Performance

## Objective
To investigate how varying Signal-to-Noise Ratio (SNR) affects the demodulation performance of a communication system.

---

## Description

This experiment simulates a digital communication system using:

- Binary message signal
- Amplitude Shift Keying (ASK) modulation
- Gaussian noise addition
- Signal demodulation

---

## Steps Performed

1. Generated random binary signal
2. Applied ASK modulation
3. Added noise at different SNR levels:
   - 10 dB
   - 5 dB
   - 0 dB
   - -5 dB
4. Demodulated signal using envelope detection
5. Recovered binary signal using thresholding
6. Plotted results

---

## Observations

- At high SNR (10 dB), the signal is clear with minimal noise
- At medium SNR (5 dB), slight distortion appears
- At low SNR (0 dB), noise significantly affects signal quality
- At very low SNR (-5 dB), the signal becomes highly distorted

---

## Conclusion

Higher SNR leads to better communication system performance. Noise degrades signal quality and affects accurate signal recovery.

---
