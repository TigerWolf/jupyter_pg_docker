FROM jupyter/minimal-notebook

COPY ./requirements.txt /tmp/requirements.txt
USER root
RUN apt-get update && apt-get install -y libpq-dev git
RUN pip install -r /tmp/requirements.txt
