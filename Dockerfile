FROM python:3.9.1

ADD . /app
WORKDIR /app
RUN pip install -r requirements.txt

ENV HOST '0.0.0.0'

CMD ["python", "app.py"]