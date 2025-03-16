# Verwenden Sie ein Basis-Image mit Python und Spark
FROM jupyter/pyspark-notebook:latest

# Setzen Sie die Umgebungsvariablen
ENV PYSPARK_PYTHON=python3
ENV PYSPARK_DRIVER_PYTHON=python3

# Installieren Sie zusätzliche Python-Bibliotheken nach Bedarf
RUN pip install --no-cache-dir pandas numpy matplotlib sparky 

# Installieren Sie Netcat
USER root
RUN apt-get update && apt-get install -y netcat
USER jovyan

# Setzen Sie das Arbeitsverzeichnis
WORKDIR /home/jovyan/work

# Exponieren Sie den Standardport für Jupyter Notebook
EXPOSE 8888

# Starten Sie Jupyter Notebook
CMD ["start-notebook.sh"]