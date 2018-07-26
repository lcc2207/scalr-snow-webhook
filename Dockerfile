FROM debian:jessie-slim
MAINTAINER Scalr <@scalr.com>

RUN apt-get update && \
    apt-get install -y --no-install-recommends python python-dev python-pip uwsgi uwsgi-plugin-python && \
    groupadd uwsgi && \
    useradd -g uwsgi uwsgi

COPY ./requirements.txt /opt/snow-webhook/

RUN pip install -r /opt/snow-webhook/requirements.txt

COPY . /opt/snow-webhook

EXPOSE 5018

CMD ["/usr/bin/uwsgi", "--ini", "/opt/snow-webhook/uwsgi.ini"]
