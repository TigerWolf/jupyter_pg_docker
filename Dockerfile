FROM jupyter/minimal-notebook

COPY ./requirements.txt /tmp/requirements.txt
USER root
RUN apt-get update && apt-get install -y postgresql-client
RUN pip install -r /tmp/requirements.txt
