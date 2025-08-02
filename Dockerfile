# --------------------------------------------------
# Base: Ubuntu 22.04 + CUDA 11.8 + cuDNN 8
# --------------------------------------------------
FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive

# --------------------------------------------------
# Install Base System Dependencies
# --------------------------------------------------
RUN apt-get update && apt-get install -y \
    python3 python3-dev python3-pip python3-venv \
    build-essential cmake git wget curl unzip \
    libgl1-mesa-glx libglib2.0-0 libsm6 libxrender1 libxext6 \
    nano gedit x11-apps \
    && ln -sf /usr/bin/python3 /usr/bin/python \
    && ln -sf /usr/bin/pip3 /usr/bin/pip \
    && apt-get clean

# --------------------------------------------------
# Install Python Packages (Compatible Versions)
# --------------------------------------------------
RUN pip install --upgrade pip && \
    pip install \
    torch==2.2.2+cu118 torchvision==0.17.2+cu118 torchaudio==2.2.2 \
    -f https://download.pytorch.org/whl/torch_stable.html && \
    pip install \
    wheel \
    tqdm \
    evo \
    scipy \
    open3d==0.18.0 \
    gdown \
    tensorboard \
    opencv-python==4.5.5.64 \
    pyyaml \
    numpy

# --------------------------------------------------
# Clone the DROID-SLAM GitHub Repository
# --------------------------------------------------
WORKDIR /workspace
RUN git clone https://github.com/MSanthosh08/DROID-SLAM.git

# Optional: install any local dependencies if needed
WORKDIR /workspace/DROID-SLAM

# --------------------------------------------------
# Default shell
# --------------------------------------------------
CMD ["/bin/bash"]

