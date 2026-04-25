import socket
import time
import random

# Configuration 
HOST = "127.0.0.1"   # localhost
PORT = 5005

def generate_temperature():
    """Simulate a temperature sensor reading."""
    return round(random.uniform(18.0, 35.0), 2)

def run_sensor():
    print(f"[Sensor] Connecting to edge device at {HOST}:{PORT} ...")

    while True:
        try:
            with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
                s.connect((HOST, PORT))
                print(f"[Sensor] Connected.")

                while True:
                    temperature = generate_temperature()
                    message = str(temperature)
                    s.sendall(message.encode("utf-8"))
                    print(f"[Sensor] Sent: {message} °C")
                    time.sleep(2)   # send a new reading every 2 seconds

        except ConnectionRefusedError:
            print("[Sensor] Edge device not ready yet. Retrying in 3s...")
            time.sleep(3)
        except (BrokenPipeError, ConnectionResetError):
            print("[Sensor] Connection lost. Reconnecting...")
            time.sleep(2)

if __name__ == "__main__":
    run_sensor()
