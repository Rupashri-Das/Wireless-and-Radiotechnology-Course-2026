import socket
import random
import time

def run_client():

    client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    server_ip = "10.183.168.41"   # replace with SERVER computer IP
    server_port = 8000

    client.connect((server_ip, server_port))

    print("Connected to server")

    while True:

        # generate random temperature
        temperature = round(random.uniform(20.0, 30.0), 1)

        message = f"Temperature: {temperature} C"

        client.send(message.encode("utf-8"))

        print("Sent:", message)

        time.sleep(5)   # wait 5 seconds

run_client()
