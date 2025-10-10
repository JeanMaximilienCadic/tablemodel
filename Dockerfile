FROM python:3.14.0

WORKDIR /workspace

RUN pip install git+https://github.com/JeanMaximilienCadic/tablemodel --no-cache-dir
