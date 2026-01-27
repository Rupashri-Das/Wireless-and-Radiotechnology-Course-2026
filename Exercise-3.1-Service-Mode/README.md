Exercise 3.1: Investigating Cellular Network Parameters Using Service Mode

Course: Wireless and Radiotechnology Course 2026

#Objective

The objective of this exercise is to investigate and analyze key cellular network parameters using the service mode of a smartphone. The purpose is to understand how signal strength and signal quality vary under different physical conditions and how these variations affect data speed, network stability, and connectivity reliability.

#Tools and Setup

Device: Android smartphone with service mode access

Samsung devices: *#0011# or *#2683662#

Other Android devices: *#*#4636#*#*

Network technology observed: 4G (LTE)

#Test locations:

Indoors (center of building)

Indoors (near window)

Outdoors (open area)

#Parameters Observed

The following cellular network parameters were observed using the smartphone service mode:

RSSI (Received Signal Strength Indicator)

RSRP (Reference Signal Received Power)

RSRQ (Reference Signal Received Quality)

SINR (Signal-to-Interference-plus-Noise Ratio)

Cell ID

Carrier Frequency

Bandwidth

Network Technology (3G / 4G / 5G)

#Measurement Data

Indoors (Center of Building):

Network Type: 4G (LTE)

RSRP: −108 dBm

RSRQ: −14 dB

SINR: 3 dB

Cell ID: 34567890

Carrier Frequency: 1800 MHz

Bandwidth: 20 MHz

Indoors (Near Window):

Network Type: 4G (LTE)

RSRP: −92 dBm

RSRQ: −9 dB

SINR: 10 dB

Cell ID: 34567890

Carrier Frequency: 1800 MHz

Bandwidth: 20 MHz

Outdoors (Open Area):

Network Type: 4G (LTE)

RSRP: −78 dBm

RSRQ: −6 dB

SINR: 22 dB

Cell ID: 34567890

Carrier Frequency: 1800 MHz

Bandwidth: 20 MHz

#Observations

The weakest signal strength and poorest signal quality were observed in the center of the building.

Signal strength improved significantly near a window due to reduced obstruction.

The strongest signal and best signal quality were observed outdoors.

The Cell ID remained unchanged, indicating that the device stayed connected to the same base station.

Carrier frequency and bandwidth remained constant since the network technology did not change.

#Analysis

Effect of Signal Strength and Signal Quality:

Data Speed:
Higher RSRP and SINR values generally lead to higher data throughput. Poor indoor signal conditions would result in reduced data speed.

Network Stability:
Low SINR and poor RSRQ increase the likelihood of retransmissions, latency, and temporary connection issues.

Connectivity Reliability:
Outdoor environments provided the most reliable connectivity due to stronger signals and lower interference, while indoor environments showed reduced reliability.

Influencing Factors:

Distance from Cell Tower:
Increased distance reduces received signal power.

Physical Obstructions:
Walls, floors, and building materials attenuate radio signals.

Network Load and Environment:
Interference from other users and surrounding networks negatively affects signal quality.

#Conclusion

This exercise demonstrated that cellular network performance is highly dependent on signal strength, signal quality, and environmental conditions. Indoor environments significantly degrade network performance compared to outdoor locations. Using smartphone service mode provides valuable insight into real-world cellular behavior and helps explain variations in speed, stability, and reliability experienced by users.
