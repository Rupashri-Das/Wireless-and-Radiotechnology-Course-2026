import paho.mqtt.client as mqtt
import requests

# Configuration
BROKER   = "broker.emqx.io"
PORT     = 1883
TOPIC    = "savonia/iot/temperature"

TOKEN    = "8633117366:AAF1Kev3xt4Lu70hZM5PcVoFGFd_NqEYPyA"   # paste your token here
CHAT_ID  = "8454572761"         # paste your chat ID here

THRESHOLD = 28.0   # alert fires when temperature exceeds this


def send_telegram(message):
    url     = f"https://api.telegram.org/bot{TOKEN}/sendMessage"
    payload = {"chat_id": CHAT_ID, "text": message}
    try:
        response = requests.post(url, data=payload)
        if response.status_code == 200:
            print(f"[Telegram] Alert sent: {message}")
        else:
            print(f"[Telegram] Failed to send. Status: {response.status_code}")
    except Exception as e:
        print(f"[Telegram] Error: {e}")

def on_connect(client, userdata, flags, rc):
    if rc == 0:
        print(f"[MQTT] Connected to broker: {BROKER}")
        client.subscribe(TOPIC)
        print(f"[MQTT] Subscribed to topic: {TOPIC}")
    else:
        print(f"[MQTT] Connection failed, code: {rc}")

def on_message(client, userdata, msg):
    try:
        temperature = float(msg.payload.decode().strip())
        print(f"[Sensor] Temperature: {temperature} °C")

        if temperature > THRESHOLD:
            alert = f"ALERT: High temperature detected!\nValue: {temperature} °C\nThreshold: {THRESHOLD} °C"
            print(f"[Alert] {alert}")
            send_telegram(alert)
        else:
            print(f"[Status] Temperature is normal ({temperature} °C)")

    except ValueError:
        print(f"[Error] Could not parse message: {msg.payload}")

client = mqtt.Client(client_id="alert-subscriber-01", protocol=mqtt.MQTTv311)
client.on_connect = on_connect
client.on_message = on_message
client.connect(BROKER, PORT, keepalive=60)
client.loop_forever()
