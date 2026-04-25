import paho.mqtt.client as mqtt
import requests

broker = "broker.emqx.io"
topic = "savonia/iot/temperature"

TOKEN = "PASTE_YOUR_TOKEN"
CHAT_ID = "PASTE_YOUR_CHAT_ID"

threshold = 28

def send_telegram(message):
    url = f"https://api.telegram.org/bot{TOKEN}/sendMessage"

    payload = {
        "chat_id": CHAT_ID,
        "text": message
    }

    requests.post(url, data=payload)

def on_message(client, userdata, msg):
    temperature = float(msg.payload.decode())
    print("Cloud received:", temperature)

    if temperature > threshold:
        alert = f"ALERT: High temperature {temperature} °C"
        print(alert)
        send_telegram(alert)

client = mqtt.Client()
client.connect(broker, 1883)

client.subscribe(topic)
client.on_message = on_message

print("Cloud listening...")

client.loop_forever()
