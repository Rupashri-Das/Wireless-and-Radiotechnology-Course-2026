import socket
import time
import random

# Configuration
HOST = "127.0.0.1"
PORT = 5000

def run_sensor():
    print(f"[Sensor] Connecting to edge device at {HOST}:{PORT} ...")
    while True:
        try:
            with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
                s.connect((HOST, PORT))
                print("[Sensor] Connected.")
                while True:
                    # Range goes up to 35 so alerts fire frequently for testing
                    temperature = round(random.uniform(20, 35), 2)
                    s.sendall(str(temperature).encode("utf-8"))
                    print(f"[Sensor] Sent: {temperature} °C")
                    time.sleep(5)
        except ConnectionRefusedError:
            print("[Sensor] Edge device not ready. Retrying in 3s...")
            time.sleep(3)
        except (BrokenPipeError, ConnectionResetError):
            print("[Sensor] Connection lost. Reconnecting...")
            time.sleep(2)

if __name__ == "__main__":
    run_sensor()
