# MQTT Alert System (Single Laptop Setup)

## System Architecture

Sensor → Edge → MQTT Broker → Cloud → Telegram

(All components run on one laptop using different terminals)

---

## MQTT Topic

savonia/iot/temperature

---

## How It Works

- Sensor sends temperature using socket
- Edge device receives and publishes to MQTT
- Cloud subscribes and checks threshold
- If temperature > 28°C → Telegram alert sent

---

## Screenshot

![Alert](screenshot.png)

---

## Reflection

MQTT is useful because it enables lightweight and real-time communication using publish/subscribe model.

It is efficient, scalable, and ideal for IoT monitoring systems where devices are loosely connected.

---

## Author
Rupashri Das
