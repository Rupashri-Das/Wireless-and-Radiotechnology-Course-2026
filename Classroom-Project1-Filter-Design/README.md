# Project 1: Filter Design for Signal Frequency Components

## Input Signal

The input signal is a sum of sine waves:

**Input Signal = A₁·sin(2π·100·t) + A₂·sin(2π·200·t) + A₃·sin(2π·300·t) + A₄·sin(2π·400·t)**

The signal contains four frequency components: **100 Hz, 200 Hz, 300 Hz, and 400 Hz**.

---

## Filter Design Table

| Frequency Component     | Filter Type              | Cutoff Frequency/Frequencies |
|------------------------|--------------------------|-------------------------------|
| 100 Hz                 | Low Pass Filter (LPF)    | 150 Hz                        |
| 400 Hz                 | High Pass Filter (HPF)   | 350 Hz                        |
| 100 Hz and 200 Hz      | Low Pass Filter (LPF)    | 250 Hz                        |
| 200 Hz                 | Band Pass Filter (BPF)   | 150 Hz and 250 Hz             |
| 300 Hz                 | Band Pass Filter (BPF)   | 250 Hz and 350 Hz             |
| 300 Hz and 400 Hz      | High Pass Filter (HPF)   | 250 Hz                        |
| 200 Hz and 300 Hz      | Band Pass Filter (BPF)   | 150 Hz and 350 Hz             |
| 200 Hz, 300 Hz, and 400 Hz | High Pass Filter (HPF) | 150 Hz                      |
| 100 Hz and 400 Hz      | Band Stop Filter (BSF)   | 150 Hz and 350 Hz             |

---

## Design Reasoning

Cutoff frequencies are placed **midway between adjacent frequency components** to ensure clean separation:

- Gap between 100 Hz and 200 Hz → cutoff at **150 Hz**
- Gap between 200 Hz and 300 Hz → cutoff at **250 Hz**
- Gap between 300 Hz and 400 Hz → cutoff at **350 Hz**

### Filter type selection logic:
- **LPF** – keep everything *below* a cutoff (low frequencies pass through)
- **HPF** – keep everything *above* a cutoff (high frequencies pass through)
- **BPF** – keep only a *range* between two cutoffs
- **BSF** – *block* a range between two cutoffs, keep everything outside
