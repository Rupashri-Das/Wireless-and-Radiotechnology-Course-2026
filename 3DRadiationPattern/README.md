# 3D Radiation Pattern of an Omnidirectional Antenna

**Course:** Wireless and Radio Technology 2026  

---

## 📖 Overview

This exercise plots the **3-Dimensional radiation pattern** of an omnidirectional antenna using MATLAB. The antenna radiates equally in all directions (field pattern = 1), producing a perfect sphere as the 3D pattern. Spherical coordinates are converted to Cartesian coordinates to render the surface plot.

---

## 📐 Theory

An **omnidirectional antenna** has a field pattern:

$$E(\theta, \phi) = 1$$

This means the antenna radiates with equal intensity in every direction. When plotted in 3D using spherical-to-Cartesian conversion, the result is a perfect sphere of unit radius.

The conversion from spherical to Cartesian is:

$$X = r \cdot \cos(\phi) \cdot \cos(\theta)$$
$$Y = r \cdot \cos(\phi) \cdot \sin(\theta)$$
$$Z = r \cdot \sin(\phi)$$

Where r = |E(θ, φ)| is the radial magnitude of the pattern.

---

## 📁 Files

| File | Description |
|------|-------------|
| `RadiationPattern3D.m` | MATLAB code to plot the 3D radiation pattern |
| `result_3D_pattern.png` | Screenshot of the 3D sphere output |

---

## ▶️ How to Run

1. Open MATLAB and open `RadiationPattern3D.m`
2. Press **Run (F5)**
3. Answer the prompts in the Command Window:

```
The lower bound of theta in degree= 0
The upper bound of theta in degree= 360
The lower bound of phi in degree= 0
The upper bound of phi in degree= 360
The field pattern: E(THETA,PHI)= 1
The field pattern: P(THETA,PHI)= 1
```

4. A 3D sphere titled **"3 D Pattern"** will appear in a figure window

---

## 📊 Expected Output

**Command Window:**
```
Input Parameters:
--------------------
Theta = 0 :  2 : 360
Phi   = 0 :  4 : 360
FIELD PATTERN : 1

Output is shown in the figure below-----------
```

**Figure Window:** A 3D colored mesh sphere representing uniform radiation in all directions.

---

## 🔑 Key MATLAB Concepts Used

| Command | Purpose |
|---------|---------|
| `meshgrid(theta, phi)` | Creates a 2D grid of all (θ, φ) angle combinations |
| `abs(y1)` | Takes absolute value of field pattern (radius must be ≥ 0) |
| `max(max(y))` | Finds the peak value of the pattern matrix |
| `sph2cart(az, el, r)` | Converts spherical coordinates to Cartesian (X, Y, Z) |
| `mesh(X, Y, Z)` | Draws a 3D wireframe/mesh surface from coordinate matrices |

---

## 👤 Author

**Name:** *Rupashri Das*  
**Course:** Wireless and Radio Technology 2026
