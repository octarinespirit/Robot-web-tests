import socket
from robot.api.deco import keyword

@keyword
def scan_port(host, port, timeout=2):
    """Checks if given port on given host is open"""
    try:
        with socket.create_connection((host, int(port)), timeout):
            return "open"
    except (socket.timeout, ConnectionRefusedError):
        return "closed"
