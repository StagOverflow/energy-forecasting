FROM apache/airflow:2.6.2

ARG CURRENT_USER=$USER
ARG ACCEPT_EULA="Y"

USER root
# Install Python dependencies to be able to process the wheels from the private PyPI server.
RUN apt-get -y update && apt-get -y upgrade && ACCEPT_EULA=Y
RUN apt-get install -y python3.9-distutils python3.9-dev build-essential
USER ${CURRENT_USER}
