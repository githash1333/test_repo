# Use an official Ubuntu image as the base
FROM ubuntu:latest

# Set non-interactive mode for apt to avoid manual prompts
ENV DEBIAN_FRONTEND=noninteractive


FROM python:3.10-slim


# Copy application files
WORKDIR /app
COPY . /app


# Install system dependencies
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libgles2-mesa \
    libegl1-mesa \
    libgles2 \
    libx11-6 \
    libxext6 \
    libxrender1 \
    libsm6 \
    libffi-dev \
    libgstreamer1.0 \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-libav \
    gstreamer1.0-alsa \
    gstreamer1.0-pulseaudio \
    openjdk-17-jdk \
    unzip \
    git \
    && rm -rf /var/lib/apt/lists/*
# Update system packages and install required dependencies
RUN apt update && apt install -y \
    git zip unzip \
    openjdk-17-jdk python3-pip \
    autoconf libtool pkg-config \
    zlib1g-dev libncurses5-dev libncursesw5-dev libtinfo5 \
    cmake libffi-dev libssl-dev \
    docker.io \
    && rm -rf /var/lib/apt/lists/*  


# Update system packages and install required dependencies
RUN apt-get update && apt-get install -y \
    python3-pip \
    build-essential \
    git \
    python3 \
    python3-dev \
    ffmpeg \
    libsdl2-dev \
    libsdl2-image-dev \
    libsdl2-mixer-dev \
    libsdl2-ttf-dev \
    libportmidi-dev \
    libswscale-dev \
    libavformat-dev \
    libavcodec-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*  


# Update system packages and install required dependencies
RUN apt-get update && apt-get install -y \
    libgstreamer1.0-0 \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    && rm -rf /var/lib/apt/lists/*  


# Update system packages and install required dependencies
# RUN apt-get update && apt-get install -y \
#     build-essential \
#     libsqlite3-dev \
#     sqlite3 \
#     bzip2 \
#     libbz2-dev \
#     zlib1g-dev \
#     libssl-dev \
#     openssl \
#     libgdbm-dev \
#     libgdbm-compat-dev \
#     liblzma-dev \
#     libreadline-dev \
#     libncursesw5-dev \
#     libffi-dev \
#     uuid-dev \
#     libffi6 \
#     && rm -rf /var/lib/apt/lists/*  

# Update system packages and install required dependencies
RUN apt-get update && apt-get install -y \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*  

# Verify installation (optional)
RUN dpkg -l | grep libffi

# Verify installations (optional)
# RUN gcc --version && sqlite3 --version && openssl version

# Verify installations (optional)
# RUN gst-inspect-1.0 --version

# Verify installations (optional)
RUN java -version && python3 --version && git --version



# Download and install Android SDK
# RUN mkdir -p ${ANDROID_HOME} && cd ${ANDROID_HOME} && \
#     wget https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip && \
#     unzip commandlinetools-linux-7583922_latest.zip -d tools && \
#     rm commandlinetools-linux-7583922_latest.zip

# # Set up Android SDK
# RUN yes | sdkmanager --sdk_root=${ANDROID_HOME} --licenses
# RUN sdkmanager --sdk_root=${ANDROID_HOME} "platform-tools" "platforms;android-30" "build-tools;30.0.3"


# Set environment variables for Kivy
ENV BUILD_SERVER_PORT=8501
ENV KIVY_GL_BACKEND="sdl2"
ENV DISPLAY=:0



RUN pip3 install --upgrade pip
# Install Python dependencies
RUN python3 -m pip install --no-cache-dir -r requirements.txt

# Install pip dependencies
RUN pip install --no-cache-dir --upgrade pip setuptools wheel
# Install Kivy and KivyMD
# Install Kivy, KivyMD, and required dependencies
# RUN pip install \
#     Kivy==2.3.1 \
#     kivy-deps.angle==0.4.0 \
#     kivy-deps.glew==0.3.1 \
#     Kivy-Garden==0.1.5 \
#     kivy-garden.xcamera==2020.613 \
#     kivy_deps.sdl2==0.8.0 \
#     kivymd==1.2.0

# RUN python3 -m pip install pywin32
# RUN python3 -m pip install sh

# #pypiwin32
# RUN python3 -m pip install pypiwin32
# RUN pip install --no-cache-dir kivy kivy-examples buildozer cython





# Expose P4A and server port
# EXPOSE 8501

# Ensure buildozer.spec file contains server and port configuration
RUN if [ -f buildozer.spec ]; then \
        sed -i 's/# server = .*/server = localhost/' buildozer.spec && \
        sed -i 's/# port = .*/port = 8501/' buildozer.spec; \
    fi

# Run Buildozer to build Android APK
CMD ["buildozer", "android", "debug"]
