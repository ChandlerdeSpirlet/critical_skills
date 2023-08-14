# syntax=docker/dockerfile:1
FROM python:3.7-alpine
WORKDIR /code
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN apk add --allow-untrusted --repository http://dl-cdn.alpinelinux.org/alpine/v3.15/main --no-cache gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
COPY Combined_pem.pem Combined_pem.pem
RUN pip config set global.cert ./Combined_pem.pem
RUN pip install --index-url=https://e411650:dUZytr0z4CPUGEV0mIhwmlwV3pw0W1@nexus.global.lmco.com/repository/pypi-proxy/simple/ --cert ./Combined_pem.pem -r requirements.txt
EXPOSE 5000
COPY . .
CMD ["flask", "run"]
