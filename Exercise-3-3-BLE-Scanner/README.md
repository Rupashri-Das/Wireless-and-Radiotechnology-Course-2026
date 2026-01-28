Exercise 3.3: Exploring Bluetooth Low Energy (BLE) Networks with BLE Scanner
Objective

The objective of this exercise is to investigate nearby Bluetooth Low Energy (BLE) devices using a BLE Scanner mobile application and analyze how device visibility and signal characteristics vary across different environments.

Tools Used

BLE Scanner mobile application (Android / iOS)

Smartphone with Bluetooth enabled

GitHub for documentation

Scanning Environments and Setup

BLE scans were performed in the following environments:

1. Classroom

Indoor environment with multiple students and electronic devices

Presence of Wi-Fi routers, laptops, and smartphones

2. Hallway

Semi-open indoor space

Fewer people and devices compared to classroom

3. Outdoor Area

Open environment

Minimal physical obstructions

Fewer BLE devices detected

Data Collection

Classroom environment:
Detected device: Mi Band
Signal strength (RSSI): -55 dBm
Device identifier: XX:XX:XX

Hallway environment:
Detected device: Unknown BLE device
Signal strength (RSSI): -72 dBm
Device identifier: YY:YY:YY

Outdoor environment:
Detected device: Bluetooth Earbuds
Signal strength (RSSI): -85 dBm
Device identifier: ZZ:ZZ:ZZ

During each scan, the following information was recorded:

Device name (if available)

Signal strength (RSSI in dBm)

MAC address or device identifier (if visible)
Analysis and Observations
RSSI and Distance Relationship

Stronger RSSI values (e.g. -40 to -60 dBm) indicate closer proximity

Weaker RSSI values (e.g. -80 dBm and below) suggest greater distance or obstructions

RSSI fluctuated even when the device position remained unchanged

Environment Comparison

Classroom: Highest number of BLE devices detected

Hallway: Moderate number of devices

Outdoor: Fewest devices with weaker signals

Patterns and Anomalies

RSSI values fluctuated due to:

Human movement

Walls and furniture

Interference from Wi-Fi and other Bluetooth devices

Some devices appeared without names, exposing only identifiers

Technical Factors Affecting BLE Scans

Transmission power of devices

Physical obstructions (walls, bodies, metal objects)

Environmental noise and signal interference

Device advertising intervals

Security and Privacy Considerations

BLE technology is widely used in:

Wearable devices (smartwatches, fitness trackers)

IoT sensors

Wireless earbuds

Location beacons

Potential Risks

Device tracking using static MAC addresses

Identifier exposure during passive scanning

Privacy concerns when devices broadcast continuously

Unauthorized monitoring in public spaces

Modern devices mitigate these risks by using MAC address randomization, but not all devices implement this correctly.

Conclusion

This exercise demonstrated how BLE devices are pervasive in everyday environments and how signal characteristics vary based on location and surroundings. The results highlight the importance of understanding BLE behavior, especially in relation to signal reliability, environmental interference, and privacy implications.
