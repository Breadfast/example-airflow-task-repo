FROM python:3.10.8-slim-buster AS base

ARG USERNAME
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    VIRTUAL_ENV=/opt/venv \
    USER_HOME=/home/${USERNAME}

RUN apt-get update && \
    useradd -ms /bin/bash -d $USER_HOME ${USERNAME} && \
    python -m venv ${VIRTUAL_ENV}


ENV PATH="$VIRTUAL_ENV/bin:$PATH"

WORKDIR $USER_HOME

COPY ./requirements ./requirements

COPY --chown=${USERNAME} ./src ./src

RUN pip install --upgrade pip 
# This step is required when having a dependency on a python package hosted on google artifact registry
# RUN pip install keyrings.google-artifactregistry-auth==1.1.2

RUN pip install -r ./requirements/base.txt

USER ${USERNAME}

