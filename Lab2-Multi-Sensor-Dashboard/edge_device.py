import socket
import paho.mqtt.client as mqtt

# Socket Configuration 
HOST = "0.0.0.0"
PORT = 5000
# MQTT Configuration
MQTT_BROKER = "broker.emqx.io"
MQTT_PORT   = 1883

TOPIC_TEMP     = "savonia/iot/temperature"
TOPIC_HUMIDITY = "savonia/iot/humidity"
TOPIC_LIGHT    = "savonia/iot/light"


def on_connect(client, userdata, flags, rc):
    if rc == 0:
        print(f"[MQTT] Connected to broker: {MQTT_BROKER}")
    else:
        print(f"[MQTT] Connection failed, code: {rc}")

mqtt_client = mqtt.Client(client_id="edge-device-lab2", protocol=mqtt.MQTTv311)
mqtt_client.on_connect = on_connect
mqtt_client.connect(MQTT_BROKER, MQTT_PORT, keepalive=60)
mqtt_client.loop_start()

def run_edge():
    print(f"[Edge] Listening on port {PORT} ...")

    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as server:
        server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        server.bind((HOST, PORT))
        server.listen(1)
        print("[Edge] Waiting for sensor to connect...")

        while True:
            conn, addr = server.accept()
            print(f"[Edge] Sensor connected from {addr}")

            with conn:
                while True:
                    data = conn.recv(1024)
                    if not data:
                        print("[Edge] Sensor disconnected.")
                        break

                    message = data.decode("utf-8").strip()

                    try:
                        temperature, humidity, light = message.split(",")

                        mqtt_client.publish(TOPIC_TEMP,     temperature, qos=1)
                        mqtt_client.publish(TOPIC_HUMIDITY, humidity,    qos=1)
                        mqtt_client.publish(TOPIC_LIGHT,    light,       qos=1)

                        print(f"[Edge] Forwarded → temp={temperature}°C  "
                              f"humidity={humidity}%  light={light} lux")

                    except ValueError:
                        print(f"[Edge] Bad message format: {message}")

if __name__ == "__main__":
    run_edge()
