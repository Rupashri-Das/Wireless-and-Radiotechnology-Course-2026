import socket
import time
import random

HOST = "127.0.0.1"
PORT = 5000

s = socket.socket()
s.connect((HOST, PORT))

while True:
    temperature = round(random.uniform(20, 35), 2)
    print("Sending:", temperature)

    s.send(str(temperature).encode())
    time.sleep(2)
