# 1) Partimos de Python 3.10
FROM python:3.10-slim

# 2) Instalamos herramientas del sistema
RUN apt-get update && \
    apt-get install -y ffmpeg git build-essential cmake meson ninja-build libsndfile1-dev && \
    rm -rf /var/lib/apt/lists/*

# 3) Definimos el directorio de trabajo
WORKDIR /app

# 4) Copiamos solo los archivos de configuración
COPY pyproject.toml poetry.lock ./

# 5) Instalamos Poetry y dependencias sin dev
RUN pip install --upgrade pip && \
    pip install poetry && \
    poetry config virtualenvs.create false && \
    poetry install --no-interaction --no-ansi --without dev

# 6) Copiamos el resto del código
COPY . .

# 7) Exponemos el puerto de Gradio
EXPOSE 7860

# 8) Comando por defecto: arrancar demo en CPU
CMD ["bash","-lc","export DEVICE=cpu && python3 tools/gradio_demo.py"]
