FROM python:3.11-slim

WORKDIR /app

# 1) Instala git y herramientas de compilación (build-essential)
RUN apt-get update && \
    apt-get install -y git build-essential && \
    rm -rf /var/lib/apt/lists/*

# 2) Copia el requirements para cachear la capa de instalación
COPY requirements.txt .

# 3) Instala pip y luego todas las dependencias
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# 4) Copia el resto de tu código
COPY . .

# 5) Expon el puerto de Gradio
EXPOSE 7860

# 6) Arranca tu aplicación
CMD ["python3", "app.py"]
