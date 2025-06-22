# Dockerfile
FROM python:3.11-slim

# 1. Variables de entorno para que gradio no abra browser
ENV GRADIO_SERVER_NAME="0.0.0.0" \
    GRADIO_SERVER_PORT="7860"

WORKDIR /app

# 2. Copia solo lo esencial
COPY . .

# 3. Instala pip y luego tu requirements
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# 4. Exponer el puerto que usa Gradio
EXPOSE 7860

# 5. Comando por defecto: lanza tu app.py
CMD ["python3", "app.py"]
