# Bluetooth Sensor to Gateway with Python

## Project Description
This project demonstrates a simple **Bluetooth client-server system** in Python using **RFCOMM sockets**.  

- **Client (Sensor Device)**: Simulates an IoT sensor that generates random temperature values every 5 seconds and sends them via Bluetooth to the server.  
- **Server (Gateway Device)**: Receives and prints the sensor data in real time.  

Example messages sent by the client:
Temperature: 22.8 C
Temperature: 23.4 C
Temperature: 21.9 C


This assignment helps understand **Bluetooth socket communication** in Python and how it differs from WiFi communication.

---

## Files
- `server.py` — Python script for the server (gateway)  
- `client.py` — Python script for the client (sensor)  

---

## Bluetooth MAC Address Used
Both server and client are using the MAC address of the **server device**:
7C:FA:80:F2:03:3F

> Replace this with your own device's Bluetooth MAC address if testing on different hardware.

---

## How to Run

### 1. Server (Gateway Device)
1. Open a terminal or command prompt.  
2. Navigate to the folder containing `server.py`.  
3. Run the server:

```bash
python server.py

You will see:

Waiting for Bluetooth client connection...

### 2. Client (Sensor Device)

Open a terminal or command prompt on the client device.

Navigate to the folder containing client.py.

Update server MAC address in client.py if needed:

client.connect(("7C:FA:80:F2:03:3F", 4))

Run the client:

python client.py

You will see:

Connected to Bluetooth server
Sent: Temperature: 23.5 C
Sent: Temperature: 24.1 C
...

The client will automatically send random temperature values every 5 seconds.

Example Output

Server
Waiting for Bluetooth client connection...
Connected to: ('7C:FA:80:F2:03:3F', 4)
Received: Temperature: 23.5 C
Received: Temperature: 24.1 C
Received: Temperature: 22.9 C

Client
Connected to Bluetooth server
Sent: Temperature: 23.5 C
Sent: Temperature: 24.1 C
Sent: Temperature: 22.9 C

Reflection

1. What did you learn?

How to use Python RFCOMM Bluetooth sockets for device-to-device communication.

How to simulate sensor data and send it over Bluetooth.

Handling continuous data sending and receiving in Python.

2. What was difficult?

Pairing devices and ensuring correct Bluetooth MAC addresses.

Handling connection errors and disconnections.

Understanding the difference between Bluetooth and WiFi socket protocols.

3. Where could Bluetooth communication be useful in IoT?

Connecting low-power sensors to gateways in smart homes.

Wearable devices sending data to mobile phones.

Industrial IoT devices in close-range monitoring applications.

4. Difference between Bluetooth and WiFi socket communication in practice:

Bluetooth: Short-range, device-to-device, low-power communication. Best for personal area networks.

WiFi: Longer range, network-based, higher bandwidth. Can communicate over LAN or Internet.

Code is similar in structure, but the socket type and connection method differ.

Author: Rupashri Das
Date: March 2026
