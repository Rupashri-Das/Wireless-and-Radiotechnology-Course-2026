# Project 3: RF System Decomposition — Nordic nRF52840

## Student Information
- **Device selected:** Nordic nRF52840 (BLE SoC)
- **Datasheet:** [nRF52840 Product Specification v1.7](https://infocenter.nordicsemi.com/pdf/nRF52840_PS_v1.7.pdf)
- **Block diagram reference:** Section 7 (Radio) and Figure 1 (Block Diagram) in the datasheet

---

## Device Overview

The Nordic nRF52840 is a multiprotocol 2.4 GHz System-on-Chip (SoC) supporting Bluetooth Low Energy (BLE 5), IEEE 802.15.4 (Zigbee/Thread), and proprietary 2.4 GHz protocols. All major RF system blocks — including the transceiver, PA, LNA, and power management — are fully integrated on a single chip. An external antenna and a small matching network are the only components needed outside the SoC.

---

## RF System Block Diagram

See file: **rf_block_diagram.svg** (in this folder)

Signal flow summary:
- **TX path:** MCU → Modulator → Power Amplifier (PA) → Balun/Matching Network → Antenna
- **RX path:** Antenna → Balun/Matching Network → Low Noise Amplifier (LNA) → Demodulator → MCU

---

## RF Block Explanations

### 1. Information Source / MCU
**Role:** The ARM Cortex-M4F processor (running at up to 64 MHz) is both the information source and the controller of the entire RF system. It generates the data payload to be transmitted and processes received data from the radio subsystem.

**Signal flow:** Application data is prepared by the CPU and passed to the on-chip radio peripheral via internal registers and DMA. The BLE protocol stack (SoftDevice) also runs here, handling packet framing, timing, and encryption before handing off to the RF transceiver.

---

### 2. RF Transceiver (TX/RX functionality)
**Role:** The integrated 2.4 GHz radio transceiver is the core RF block. It switches between transmit (TX) and receive (RX) modes under software control (TDD — Time Division Duplex), meaning it never transmits and receives simultaneously.

**Signal flow:** In TX mode, the baseband digital bitstream from the MCU enters the transceiver, which drives the modulator and PA. In RX mode, the transceiver activates the LNA and demodulator and feeds the decoded bits back to the MCU. The nRF52840 transceiver covers the 2.400–2.4835 GHz ISM band across 40 BLE channels.

---

### 3. Modulation / Demodulation
**Role:** Modulation converts the digital bit stream into an analog RF signal suitable for wireless transmission. Demodulation performs the reverse — extracting digital bits from the received RF signal.

**Signal flow (TX):** The nRF52840 uses Gaussian Frequency Shift Keying (GFSK) for BLE (±250 kHz deviation, 1 Mbps) and Offset QPSK (O-QPSK) for IEEE 802.15.4. Digital bits shift the carrier frequency slightly up or down (GFSK), forming the modulated RF waveform. In RX mode, the demodulator performs matched filtering and frequency discrimination to recover the original bit stream from the received waveform, compensating for noise and frequency offset.

---

### 4. Power Amplifier (PA)
**Role:** The on-chip PA amplifies the weak modulated signal from the transceiver to a level strong enough for over-the-air transmission. It directly determines the radio transmission range.

**Signal flow:** The modulated RF signal enters the PA at a low power level and is boosted to a programmable output power between −20 dBm and +8 dBm (configurable in 4 dB steps via software). The amplified signal then passes to the output matching network. Higher PA output power increases range but also increases current consumption — the nRF52840 draws approximately 7.5 mA at +4 dBm and up to 15 mA at +8 dBm TX output.

---

### 5. Low Noise Amplifier (LNA)
**Role:** The on-chip LNA is the first active block in the receive chain. It amplifies the very weak incoming RF signal from the antenna before any further processing, while adding as little additional noise as possible.

**Signal flow:** After passing through the balun and matching network, the received 2.4 GHz signal (which can be as weak as −95 dBm) enters the LNA. The LNA provides sufficient gain to overcome the noise introduced by subsequent stages (mixers, ADC), achieving a system sensitivity of −95 dBm for BLE at 1 Mbps. The amplified signal is then fed into the demodulator.

---

### 6. RF Filtering / Matching Network
**Role:** The external matching network (typically a balun + a few passive components: inductors and capacitors) performs two functions: (1) it converts the differential RF output of the chip to a single-ended 50 Ω signal required by standard antennas and RF connectors, and (2) it matches impedances to maximize power transfer and minimize signal reflections.

**Signal flow:** In TX mode, the PA's differential output passes through the balun (balanced-to-unbalanced converter), which combines the two differential signals and transforms them into a single-ended 50 Ω signal. Filtering removes unwanted harmonics and spurious emissions. In RX mode, the same network operates in reverse — the incoming single-ended antenna signal is converted to differential and feeds the LNA.

---

### 7. Antenna Interface
**Role:** The antenna converts the electrical RF signal into electromagnetic waves for over-the-air transmission (TX), and captures incoming electromagnetic waves and converts them back to an electrical signal (RX).

**Signal flow:** The nRF52840 provides a single-ended 50 Ω RF port (pin VDDPAVDD / RF port). A PCB trace antenna, chip antenna, or external whip antenna can be connected. The antenna is designed to resonate at 2.45 GHz (center of the 2.4 GHz ISM band). Nordic's reference designs use a simple PCB meandered trace antenna achieving approximately 0 dBi gain, which together with the +8 dBm PA gives an effective range of over 100 m in open space.

---

### 8. Power Supply for RF Section
**Role:** The nRF52840 integrates a DC-DC buck converter and multiple LDO (Low Dropout) voltage regulators to efficiently supply the RF subsystem with clean, stable voltages — critical because RF circuits are sensitive to power supply noise.

**Signal flow:** The chip accepts a supply voltage of 1.7 V–5.5 V on VDDMAIN. An internal DC-DC converter steps this down efficiently to approximately 1.3 V for the digital core. Dedicated LDO regulators (VDDPA for the PA, internal RF LDO for the transceiver) provide clean, noise-isolated supplies to the RF blocks. The RF LDO isolates the sensitive 2.4 GHz analog circuits from digital switching noise on the main supply rail.

---

## Summary Table

| # | RF Block | Implementation in nRF52840 | Key Spec |
|---|---------|---------------------------|----------|
| 1 | Information source / MCU | ARM Cortex-M4F | 64 MHz, 1 MB Flash |
| 2 | RF Transceiver | Integrated 2.4 GHz radio | BLE 5, 802.15.4 |
| 3 | Modulation / Demodulation | On-chip GFSK / O-QPSK | 1 Mbps (BLE) |
| 4 | Power Amplifier (PA) | On-chip PA | −20 to +8 dBm |
| 5 | Low Noise Amplifier (LNA) | On-chip LNA | −95 dBm sensitivity |
| 6 | RF Filter / Matching | External balun + LC network | 50 Ω matching |
| 7 | Antenna Interface | 50 Ω RF port | 2.4 GHz ISM band |
| 8 | Power Supply (RF) | DCDC + LDO regulators | 1.3 V / 1.8 V / 3.3 V |
