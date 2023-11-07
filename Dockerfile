FROM python:3.8

WORKDIR /app

COPY requirements.txt /app/requirements.txt
COPY setup.sh /app/setup.sh

RUN chmod +x setup.sh && /app/setup.sh