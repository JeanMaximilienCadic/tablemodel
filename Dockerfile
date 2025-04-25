FROM python:3.13.3

WORKDIR /workspace

RUN pip install git+https://github.com/JeanMaximilienCadic/tablemodel --no-cache-dir
