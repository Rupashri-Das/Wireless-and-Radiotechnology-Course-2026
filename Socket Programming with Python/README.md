# TCP Socket Programming with Python (Two-PC Setup)

## Project Description
This project demonstrates a simple TCP client-server system using Python:

- **Server PC**: Runs the server, listens for incoming connections, and prints received messages.  
- **Client PC**: Connects to the server, generates random sensor-like data (temperature), and sends it every 5 seconds.  

Example message sent by the client:
Temperature: 23.5 C


This assignment helps understand **TCP socket communication** in Python.

---

## Files
- `server.py` — Python script for the server  
- `client.py` — Python script for the client  

---

## How to Run

### 1. Server (Server PC)
1. Open a terminal or command prompt.  
2. Navigate to the folder containing `server.py`.  
3. Run the server:

```bash
python server.py

The server listens on all network interfaces (0.0.0.0) and port 8000, allowing connections from other devices on the same network.

You will see output like:

Server is listening on port 8000

### 2. Client (Client PC) 

Open a terminal or command prompt.

Navigate to the folder containing client.py.

Update the server_ip in client.py to the server PC's IP address:
server_ip = "10.183.168.41"  # replace with server PC's actual IP

Run the client:

python client.py

The client will connect to the server and send random temperature data every 5 seconds.

Example console output:

Connected to server
Sent: Temperature: 23.5 C
Sent: Temperature: 24.1 C
Sent: Temperature: 23.8 C

Example Server Output (Receiving Data)
Server is listening on port 8000
Connection from ('192.168.1.33', 52044)
Received: Temperature: 23.5 C
Received: Temperature: 24.1 C
Received: Temperature: 23.8 C
Notes

Ensure both devices are on the same network (same WiFi or mobile hotspot).

Make sure port 8000 is open in any firewall settings.

Python 3.x is required.

Client automatically generates random temperature values between 20°C and 30°C every 5 seconds.

Author: Rupashri Das
Date: March 2026
