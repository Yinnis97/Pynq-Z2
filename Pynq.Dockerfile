# Use an appropriate ARM base image
FROM arm32v7/python:3.8-slim

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Install dependencies for Pynq and FPGA support
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    python3-pip \
    python3-dev \
    libffi-dev \
    libssl-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install the Pynq library
RUN pip install --no-cache-dir pynq

# Copy the `base.bit` overlay into the appropriate location for the Pynq library
# This assumes you have the `base.bit` file in your project directory
COPY base.bit /usr/local/share/pynq-venv/lib/python3.10/site-packages/pynq/overlays/base

# Copy your Python script into the container
COPY example_script.py /app/example_script.py

# Set the working directory
WORKDIR /app

# Install additional Python dependencies if needed (e.g., numpy)
RUN pip install --no-cache-dir numpy

# Set the default command to run your Python script
CMD ["python", "example_script.py"]
