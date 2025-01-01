#create by KH
import http.server
import socketserver

# Define the handler to use for incoming requests
handler = http.server.SimpleHTTPRequestHandler

# Set the port number for the server
port = 9898

# Create the server and bind it to the specified port
httpd = socketserver.TCPServer(("", port), handler)

print(f"Serving on port {port}")

# Run the server indefinitely
httpd.serve_forever()
