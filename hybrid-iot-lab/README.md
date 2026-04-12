# Hybrid IoT Communication Lab: Sockets + MQTT

## 📌 Overview

This project demonstrates a complete IoT communication pipeline using **Socket Programming** and **MQTT Protocol**.

The system simulates:

* A **Sensor Node**
* An **Edge Device**
* A **Cloud/Server Application**

---

## 🧠 System Architecture

```
Sensor (Laptop)
     ↓ Socket
Edge Device
     ↓ MQTT
Cloud Subscriber
```

---

## 🔄 Data Flow

1. The **sensor** generates temperature data
2. Data is sent via **socket communication** to the edge device
3. The **edge device** receives the data and forwards it using **MQTT**
4. The **cloud subscriber** receives and displays the data

---

## 🧪 Labs Covered

### ✅ Lab 1 — Socket Communication

* Communication between sensor and edge device using Python sockets

### ✅ Lab 2 — MQTT Communication

* Data transmission using MQTT publish/subscribe model

### ✅ Lab 3 — Full IoT Pipeline

* Integration of socket + MQTT into a complete system

---

## 📁 Project Structure

```
hybrid-iot-lab/
│
├── socket_server.py
├── socket_sensor.py
├── mqtt_publisher.py
├── mqtt_subscriber.py
├── edge_device.py
│
├── screenshots/
│   ├── socket.png
│   ├── mqtt.png
│   ├── full_pipeline_1.png
│   ├── full_pipeline_2.png
│   └── full_pipeline_3.png
│
└── README.md
```

---

## ⚙️ Technologies Used

* Python
* Socket Programming
* MQTT Protocol
* Paho MQTT Library

---

## 🌐 Configuration

* **IP Address Used:** `127.0.0.1` (localhost)
* **MQTT Broker:** `broker.emqx.io`
* **Port:** `1883`
* **Topic:** `savonia/iot/temperature`

---

## ▶️ How to Run (Single Laptop Setup)

Open 3 terminals:

### 1️⃣ Run Edge Device

```
python edge_device.py
```

### 2️⃣ Run Sensor

```
python socket_sensor.py
```

### 3️⃣ Run Cloud Subscriber

```
python mqtt_subscriber.py
```

---

## 📸 Output Screenshots

### 🔹 Socket Communication

Shows sensor sending data to edge device
📷 File: `socket.png`

---

### 🔹 MQTT Communication

Shows subscriber receiving data from MQTT broker
📷 File: `mqtt.png`

---

### 🔹 Full Pipeline (Multiple Screenshots)

Since a single combined view was not possible, the full pipeline is demonstrated using three screenshots:

* `full_pipeline_1.png` → Sensor output
* `full_pipeline_2.png` → Edge device output
* `full_pipeline_3.png` → Cloud subscriber output

These screenshots together demonstrate the complete flow:

**Sensor → Edge → MQTT → Cloud**

---

## 🎯 Learning Outcomes

* Understanding socket-based communication
* Implementing MQTT publish/subscribe model
* Building a simple IoT pipeline
* Learning edge computing concepts

---

## 👩‍💻 Author

Rupashri Das
