# RF Planning Studio – Short Analysis Task

## Objective
Evaluate how design parameters affect wireless link performance.

---

## Results

![Plot](results.png)


---

## Experiment Answers

### 1) Increase Gateway Height (+5m)

- Yes, maximum LOS distance increases slightly.
- Link feasibility does NOT improve significantly.

**Reason:**
Height mainly affects line-of-sight and Fresnel clearance, not path loss directly. So impact is small.

---

### 2) Increase Antenna Gain (5 dBi)

- Received power curve shifts upward.
- Range increases significantly.

**Reason:**
Higher antenna gain increases effective radiated power, improving signal strength and extending coverage.

---

### 3) Change Environment Exponent

- Increasing n reduces coverage dramatically.
- Higher n = more signal loss.

**Comparison:**
Environment exponent has stronger impact than antenna gain.

**Reason:**
n represents obstacles (buildings, trees). More obstruction → faster signal decay.

---

### 4) Move Gateway Location (Fresnel Study)

- Fresnel radius is largest at midpoint (50%).
- Midpoint is most critical for obstruction.

**Why:**
Wave spreads most in middle of link.

- If 60% clearance is violated:
  → Signal gets blocked
  → Severe degradation occurs

---

## Final Conclusion

In practical wireless deployment, the **environment exponent (n)** has the strongest impact on coverage.  

Even with high antenna gain, a poor environment (urban, dense obstacles) causes rapid signal loss.  

Antenna gain helps extend range, but cannot fully overcome environmental losses.  

Gateway height improves LOS but has limited effect on signal strength.  

Proper planning must balance antenna design and environmental conditions.  

---

## Author
Rupashri Das
