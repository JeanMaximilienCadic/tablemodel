FROM python:3.11.1

WORKDIR /workspace

RUN pip install git+https://github.com/JeanMaximilienCadic/tablemodel --no-cache-dir
