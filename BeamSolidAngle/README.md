# Beam Solid Angle of an Antenna

**Course:** Wireless and Radio Technology 2026  

---

## 📖 Overview

This exercise computes the **Beam Solid Angle (Ω_A)** of an antenna numerically using MATLAB. The beam solid angle describes how much of the sphere (in steradians) the antenna's radiation pattern covers, and is calculated by integrating the normalized power pattern over the full sphere.

---

## 📐 Theory

The Beam Solid Angle is defined as:

$$\Omega_A = \int_{\phi=0}^{2\pi} \int_{\theta=0}^{\pi} P_n(\theta, \phi) \sin\theta \, d\theta \, d\phi$$

Where:
- **Pn(θ, φ)** = Normalized power pattern
- **dΩ = sinθ dθ dφ** = Differential solid angle element
- The integration is performed over the full 4π sphere (in steradians)

In this exercise, the field pattern used is:

$$E(\theta, \phi) = \cos(\theta)$$

So the power pattern is:

$$P_n(\theta, \phi) = \cos^2(\theta)$$

---

## 📁 Files

| File | Description |
|------|-------------|
| `BeamSolidAngle_180.m` | MATLAB code — full sphere (θ: 0°→180°), result: **4.20 sr** |
| `BeamSolidAngle_90.m` | MATLAB code — half sphere (θ: 0°→90°), result: **2.10 sr** |
| `result_180.png` | Output screenshot for full sphere case |
| `result_90.png` | Output screenshot for half sphere case |

---

## ▶️ How to Run

1. Open MATLAB and navigate to this folder
2. Open either `.m` file and press **Run (F5)**
3. Answer the prompts in the Command Window:

**For full sphere (4.20 sr):**
```
The lower bound of theta in degree= 0
The upper bound of theta in degree= 180
The lower bound of phi in degree= 0
The upper bound of phi in degree= 360
The field pattern : E(THETA,PHI)= cos(THETA)
The power pattern: P(THETA,PHI)= cos(THETA).^2
```

**For half sphere (2.10 sr):**
```
The lower bound of theta in degree= 0
The upper bound of theta in degree= 90
The lower bound of phi in degree= 0
The upper bound of phi in degree= 360
The field pattern : E(THETA,PHI)= cos(THETA)
The power pattern: P(THETA,PHI)= cos(THETA).^2
```

---

## 📊 Results

| Case | Theta Range | Phi Range | Beam Area |
|------|-------------|-----------|-----------|
| Full sphere | 0° → 180° | 0° → 360° | **4.20 sr** |
| Half sphere | 0° → 90° | 0° → 360° | **2.10 sr** |

---

## 🔑 Key MATLAB Concepts Used

- `input()` — takes user input from the Command Window
- `meshgrid()` — creates a 2D grid of (θ, φ) angle combinations
- `eval()` — converts a string like `'cos(THETA)'` into actual computed values
- `sum(sum(...))` — performs numerical double integration
- `fprintf()` — formats and prints output to the Command Window

---

## 👤 Author

**Name:** *Rupashri Das*    
**Course:** Wireless and Radio Technology 2026
