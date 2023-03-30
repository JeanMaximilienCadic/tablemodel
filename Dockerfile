FROM python:3.10.10

WORKDIR /workspace

RUN pip install git+https://github.com/JeanMaximilienCadic/tablemodel --no-cache-dir
