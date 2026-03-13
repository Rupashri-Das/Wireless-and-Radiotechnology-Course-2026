import socket

def run_server():
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    server_ip = "0.0.0.0"   # allows connections from other devices
    port = 8000

    server.bind((server_ip, port))
    server.listen(1)

    print("Server is listening on port", port)

    client_socket, client_address = server.accept()
    print(f"Connection from {client_address}")

    while True:
        data = client_socket.recv(1024)

        if not data:
            break

        message = data.decode("utf-8")
        print("Received:", message)

    client_socket.close()
    server.close()
    print("Server closed")

run_server()
