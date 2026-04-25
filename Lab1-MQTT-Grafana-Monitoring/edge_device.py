import socket
import paho.mqtt.client as mqtt

# Socket Configuration (receive from sensor)
LISTEN_HOST = "0.0.0.0"   # listen on all interfaces
LISTEN_PORT = 5005
# MQTT Configuration (publish to broker) 
MQTT_BROKER = "broker.emqx.io"
MQTT_PORT   = 1883
MQTT_TOPIC  = "savonia/iot/temperature"


# MQTT callbacks 
def on_connect(client, userdata, flags, rc):
    if rc == 0:
        print(f"[MQTT] Connected to broker: {MQTT_BROKER}")
    else:
        print(f"[MQTT] Connection failed with code {rc}")

def on_publish(client, userdata, mid):
    print(f"[MQTT] Message published (mid={mid})")

# Set up MQTT client
mqtt_client = mqtt.Client(client_id="edge-device-01", protocol=mqtt.MQTTv311)
mqtt_client.on_connect = on_connect
mqtt_client.on_publish  = on_publish
mqtt_client.connect(MQTT_BROKER, MQTT_PORT, keepalive=60)
mqtt_client.loop_start()   # runs MQTT in background thread

# Socket server: receive data from sensor 
def run_edge():
    print(f"[Edge] Listening for sensor on port {LISTEN_PORT} ...")

    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as server:
        server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        server.bind((LISTEN_HOST, LISTEN_PORT))
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
                    print(f"[Edge] Received from sensor: {message} °C")

                    # Forward to MQTT broker
                    result = mqtt_client.publish(MQTT_TOPIC, message, qos=1)
                    print(f"[Edge] Published to MQTT topic '{MQTT_TOPIC}': {message}")

if __name__ == "__main__":
    run_edge()
