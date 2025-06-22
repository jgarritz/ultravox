# Dockerfile
FROM python:3.11-slim

WORKDIR /app

# Instalar git (requerido para pip git+https://…)
RUN apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

# 1) Copiamos sólo el requirements para cachear la capa de instalación
COPY requirements.txt .

# 2) Instalamos pip y luego todas las dependencias
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# 3) Ahora copiamos el resto de tu código
COPY . .

# 4) Exponemos el puerto de Gradio
EXPOSE 7860

# 5) Comando de arranque
CMD ["python3", "app.py"]
