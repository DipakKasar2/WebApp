FROM ubuntu:16.04

RUN apt-get update && apt-get install -y python python-pip

RUN pip install flask 

COPY app.py /opt/
COPY requirements.txt /opt/

# install dependencies
RUN pip install --no-cache-dir -r requirements.txt

ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0 --port=8080
