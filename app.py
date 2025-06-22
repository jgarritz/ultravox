import os

# Forzar uso de CPU
os.environ["DEVICE"] = "cpu"

# Importamos y lanzamos el demo de Gradio
from ultravox.tools.gradio_demo import demo

if __name__ == "__main__":
    demo.launch()
