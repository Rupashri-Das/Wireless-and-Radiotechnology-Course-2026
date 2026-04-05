# Adding and Removing Noise from a Signal

**Course:** Wireless and Radio Technology 2026

---

## 📖 Overview

This lab simulates the process of **adding Gaussian white noise** to a clean sinusoidal signal and then **removing it** using a low-pass Butterworth filter. This is a fundamental concept in wireless communications — real signals always arrive with noise, and filtering is one of the primary tools used to recover the original signal.

---

## 📐 Theory

### Signal Generation
A sinusoidal signal is defined as:

$$x(t) = A \cdot \sin(2\pi f t)$$

Where:
| Symbol | Meaning | Value |
|--------|---------|-------|
| A | Amplitude | 1 |
| f | Signal frequency | 5 Hz |
| fs | Sampling frequency | 1000 Hz |

### Adding Noise
Gaussian white noise is added to simulate real-world interference:

$$x_{noisy}(t) = x(t) + n(t), \quad n(t) \sim \mathcal{N}(0, \sigma^2)$$

Where σ (noise_level) = 0.5 controls the noise strength.

### Low-Pass Butterworth Filter
A Butterworth filter is applied to remove high-frequency noise while preserving the low-frequency signal:
- **Filter type:** Low-pass
- **Filter order:** 4
- **Cutoff frequency:** 10 Hz (noise above this is removed)
- **Method:** `filtfilt()` — zero-phase filtering (no time delay)

### Signal-to-Noise Ratio (SNR)
$$\text{SNR (dB)} = 10 \cdot \log_{10}\left(\frac{P_{signal}}{P_{noise}}\right)$$

Higher SNR = cleaner signal. The filter significantly improves SNR.

---

## 📁 Files

| File | Description |
|------|-------------|
| `NoiseAddRemove.m` | Main MATLAB script |
| `result_plots.png` | Screenshot of all 4 plots |
| `result_command.png` | Screenshot of Command Window output |

---

## ▶️ How to Run

1. Open MATLAB Online and open `NoiseAddRemove.m`
2. Press **Run (F5)** — no input prompts needed
3. One figure with **4 stacked plots** will appear:
   - **Plot 1:** Original clean sine wave
   - **Plot 2:** Signal with Gaussian noise added
   - **Plot 3:** Filtered signal overlaid with original and noisy
   - **Plot 4:** Frequency spectrum comparison
4. SNR results are printed in the Command Window

---

## 📊 Results

| Metric | Value |
|--------|-------|
| SNR Before Filtering | ~6 dB |
| SNR After Filtering | ~25 dB |
| SNR Improvement | ~19 dB |

---

## 🔬 Observations

**Time Domain:**
- The noisy signal has random fluctuations on top of the clean sine wave
- After filtering, the signal closely matches the original
- Some distortion remains because the filter cannot perfectly separate signal from noise

**Frequency Domain:**
- The original signal has a single spike at 5 Hz
- The noisy signal has energy spread across all frequencies
- The filtered signal shows the 5 Hz spike with most high-frequency noise removed

---

## 🧪 Experimentation — Try These Changes

| Parameter | Change | Expected Effect |
|-----------|--------|----------------|
| `noise_level` | 0.1 → 2.0 | Less/more noise visible, lower/higher SNR |
| `cutoff_freq` | 10 → 50 Hz | More noise passes through at higher cutoff |
| `cutoff_freq` | 10 → 6 Hz | Signal itself gets distorted (too low!) |
| `filter_order` | 4 → 8 | Sharper cutoff, better noise removal |
| `f_signal` | 5 → 50 Hz | Signal closer to noise — harder to filter |

---

## 🔑 Key MATLAB Commands Used

| Command | Purpose |
|---------|---------|
| `sin(2*pi*f*t)` | Generates sinusoidal signal |
| `randn(size(t))` | Generates Gaussian white noise |
| `butter(n, Wn, 'low')` | Designs Butterworth low-pass filter |
| `filtfilt(b, a, x)` | Applies zero-phase filter (no time shift) |
| `fft(x)` | Fast Fourier Transform for frequency analysis |
| `10*log10(P_s/P_n)` | Calculates SNR in decibels |

---

## 👤 Author

**Name:** *Rupashri Das*
**Course:** Wireless and Radio Technology 2026
