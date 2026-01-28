Exercise 3.2: Analyzing Network Infrastructure with NET Analyzer
Course

Wireless and Radiotechnology Course 2026

Objective

The objective of this exercise is to analyze a local Wi-Fi network using the NET Analyzer mobile application. The experiment focuses on understanding key network configuration parameters and performance metrics such as speed, latency, signal strength, and channel usage, and how these factors affect overall network performance.

Tools Required

NET Analyzer mobile application (Android / iOS)

Local Wi-Fi network (home or campus network)

Smartphone connected to the Wi-Fi network under analysis

Wi-Fi Network Analysis

The NET Analyzer application was used to analyze the Wi-Fi network to which the device was connected. The following parameters were explored and documented:

Network speed and latency

Router and gateway details

SSID and BSSID

Operating channel

Security type

Nearby Wi-Fi networks and channel usage

Measurement Data

Connected Wi-Fi Network Details

SSID: Home_Network_24G

BSSID: 3C:84:6A:XX:XX:XX

IP Address (Device): 192.168.1.25

Gateway / Router IP: 192.168.1.1

Router MAC Address: 3C:84:6A:YY:YY:YY

Security Type: WPA2-PSK

Frequency Band: 2.4 GHz

Operating Channel: Channel 6

Network Performance Measurements

Download Speed: 48 Mbps

Upload Speed: 12 Mbps

Average Latency (Ping): 28 ms

Packet Loss: 0%

Signal and Location Observations

Location: Near Router

Signal Strength: −40 dBm

Download Speed: 55 Mbps

Latency: 20 ms

Location: Same Room (Far from Router)

Signal Strength: −58 dBm

Download Speed: 45 Mbps

Latency: 30 ms

Location: Different Room

Signal Strength: −70 dBm

Download Speed: 30 Mbps

Latency: 45 ms

Nearby Wi-Fi Networks

Network A: Channel 6, Strong signal

Network B: Channel 1, Medium signal

Network C: Channel 11, Weak signal

Multiple nearby networks were detected using overlapping channels in the 2.4 GHz band.

Analysis and Troubleshooting
Identified Issues

Network Congestion:
Several nearby Wi-Fi networks were operating on the same channel (Channel 6), increasing interference.

Weak Signal Coverage:
Signal strength decreased significantly when moving away from the router, especially through walls.

Channel Overlap:
Overlapping channels in the 2.4 GHz band caused reduced throughput and increased latency.

Router Placement:
The router appeared to be placed in a non-central location, limiting coverage in distant rooms.

Proposed Improvements

Channel Optimization:
Changing the operating channel to a less congested one (e.g., Channel 1 or 11).

Router Repositioning:
Placing the router in a central, elevated location to improve coverage.

Use of 5 GHz Band:
Switching to the 5 GHz band to reduce interference and increase data rates.

Security and Configuration:
Upgrading to WPA3 (if supported) for improved security and performance.

Conclusion

This exercise demonstrated how Wi-Fi performance is influenced by signal strength, interference, router placement, and channel selection. Using the NET Analyzer application provided valuable insights into both network configuration and performance. Proper channel selection, optimal router placement, and use of appropriate frequency bands can significantly improve network speed, stability, and reliability.
