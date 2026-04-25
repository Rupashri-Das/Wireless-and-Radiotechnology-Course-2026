import socket
import paho.mqtt.client as mqtt

HOST = "127.0.0.1"
PORT = 5000

broker = "broker.emqx.io"
topic = "savonia/iot/temperature"

mqtt_client = mqtt.Client()
mqtt_client.connect(broker, 1883)

server = socket.socket()
server.bind((HOST, PORT))
server.listen(1)

print("Edge waiting for sensor...")

conn, addr = server.accept()
print("Sensor connected")

while True:
    data = conn.recv(1024)
    if not data:
        break

    temperature = data.decode()
    print("Edge received:", temperature)

    mqtt_client.publish(topic, temperature)
