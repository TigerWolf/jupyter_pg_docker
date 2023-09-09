FROM jupyter/minimal-notebook

COPY ./requirements.txt /tmp/requirements.txt
USER root
# Install packages for Postgres
RUN apt-get update && apt-get install -y libpq-dev git gcc
# Install packages for R
RUN apt-get update && apt-get install -y r-base r-base-dev
# install packages for fitzroy dependencies
RUN apt-get install -y libcurl4-openssl-dev libssl-dev
RUN apt-get install -y libxml2-dev
# Install R packages
RUN R -e "options(warn=2); install.packages('xml2')"
RUN R -e "options(warn=2); install.packages('rvest')"
RUN R -e "options(warn=2); install.packages('httr')"
RUN R -e "options(warn=2); install.packages('fitzRoy')"

# install.packages("fitzRoy") - but in Docker-eze
# Install python packages
RUN pip install -r /tmp/requirements.txt
