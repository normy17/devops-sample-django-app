FROM python:3.11.9


WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt
RUN mkdir -p /var/log/uwsgi

COPY . /app
WORKDIR /app

CMD ["uwsgi", "--master", "--ini", "/app/uwsgi.ini", "--http", "0.0.0.0:8000", "--logto", "/app/uwsgi.log"]