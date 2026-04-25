import socket
import paho.mqtt.client as mqtt

HOST = "0.0.0.0"
PORT = 5000

broker = "broker.emqx.io"
topic = "savonia/iot/temperature"

mqtt_client = mqtt.Client()
mqtt_client.connect(broker, 1883)

server = socket.socket()
server.bind((HOST, PORT))
server.listen(1)

print("Waiting for sensor...")

conn, addr = server.accept()
print("Connected:", addr)

while True:
    data = conn.recv(1024)
    if not data:
        break

    temperature = data.decode()
    print("Received:", temperature)

    mqtt_client.publish(topic, temperature)
