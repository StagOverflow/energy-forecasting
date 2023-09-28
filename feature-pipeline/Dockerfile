FROM python:3.9-slim as build
RUN apt-get update
RUN apt-get install -y --no-install-recommends build-essential gcc

WORKDIR /usr/app
RUN python -m venv /usr/app/venv
ENV PATH="/usr/app/venv/bin:$PATH"

COPY requirements.txt .
RUN pip install -r requirements.txt

FROM python:3.9-slim@sha256:8a84bc20c838be617ba720f98a894d41c4fdaa8de27c2233b9ed9335fd061420

# We don't want to run this as root
RUN groupadd -g 999 python
RUN useradd -r -u 999 -g python python
WORKDIR /usr/app/venv

# Using the venv built in the pre-stage - note all copied files are owned by 0 by default
COPY --chown=python:python --from=build /usr/app/venv ./venv
COPY --chown=python:python . .

USER 999

# Activating the venv manually
ENV PATH="/usr/app/venv/bin:$PATH"

CMD ["bash"]

