FROM python:3.7

WORKDIR /workspace

RUN pip install git+https://github.com/JeanMaximilienCadic/tablemodel --no-cache-dir
