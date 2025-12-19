#!/bin/bash

# This stops the current container
docker stop myapp || true
docker rm myapp || true

# This pulls the latest image
docker pull mydockerhubusername/myapp:latest

# This runs the container
docker run -d --name myapp -p 80:3000 mydockerhubusername/myapp:latest