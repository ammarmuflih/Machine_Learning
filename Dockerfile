# Gunakan image TensorFlow GPU resmi dari Docker Hub
FROM tensorflow/tensorflow:2.10.0-gpu

# Install tambahan untuk mendukung pengembangan (misalnya git)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set working directory di dalam container
WORKDIR /workspace

# Salin file requirements.txt ke container
COPY requirements.txt /workspace/requirements.txt

# Install dependencies dari requirements.txt
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Install Jupyter Notebook
RUN pip install jupyter

# Command default untuk menjalankan bash (bisa diganti dengan perintah lain)
CMD ["python", "/app.py"]