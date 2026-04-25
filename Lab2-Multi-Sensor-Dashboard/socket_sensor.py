import socket
import time
import random

# Configuration 
HOST = "127.0.0.1"   # localhost 
PORT = 5000


def run_sensor():
    print(f"[Sensor] Connecting to edge device at {HOST}:{PORT} ...")

    while True:
        try:
            with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
                s.connect((HOST, PORT))
                print("[Sensor] Connected.")

                while True:
                    temperature = round(random.uniform(20, 35), 2)
                    humidity    = round(random.uniform(40, 80), 2)
                    light       = round(random.uniform(100, 1000), 2)

                    message = f"{temperature},{humidity},{light}"
                    s.sendall(message.encode("utf-8"))
                    print(f"[Sensor] Sent: temp={temperature}°C  humidity={humidity}%  light={light} lux")
                    time.sleep(5)

        except ConnectionRefusedError:
            print("[Sensor] Edge device not ready. Retrying in 3s...")
            time.sleep(3)
        except (BrokenPipeError, ConnectionResetError):
            print("[Sensor] Connection lost. Reconnecting...")
            time.sleep(2)

if __name__ == "__main__":
    run_sensor()
