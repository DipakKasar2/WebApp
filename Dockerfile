#FROM ubuntu:16.04
#FROM python:3.9-slim
FROM openshift/python:3.9-ubi9

#RUN apt-get update && apt-get install -y python python-pip
WORKDIR /usr/src/app

#RUN pip install flask 

#COPY app.py /opt/
#COPY requirements.txt /opt/
COPY requirements.txt ./


# install dependencies
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
CMD ["python", "app.py"]
EXPOSE 8080

#ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0 --port=8080
