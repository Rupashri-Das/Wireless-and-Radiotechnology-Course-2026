import socket
import time
import random

HOST = "127.0.0.1"   # SAME laptop
PORT = 5000

client = socket.socket()
client.connect((HOST, PORT))

while True:
    temperature = round(random.uniform(20, 35), 2)
    print("Sensor sending:", temperature)

    client.send(str(temperature).encode())
    time.sleep(2)
