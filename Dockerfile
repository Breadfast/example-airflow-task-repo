FROM python:3.10.8-slim-buster AS baseimg

ARG USERNAME=localtest

ARG USER_HOME=/home/${USERNAME}

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    VIRTUAL_ENV=/opt/venv
    


RUN apt-get update && \
    useradd -ms /bin/bash -d $USER_HOME ${USERNAME} && \
    python -m venv ${VIRTUAL_ENV}


ENV PATH="$VIRTUAL_ENV/bin:$PATH"


WORKDIR $USER_HOME

COPY ./requirements ./requirements

COPY --chown=${USERNAME} ./src ./src

RUN pip install --upgrade pip 

RUN pip install keyrings.google-artifactregistry-auth==1.1.2

FROM baseimg AS prod

RUN pip install -r ./requirements/base.txt

USER ${USERNAME}


FROM baseimg AS dev

ARG EXTRA_INDEX_URL
RUN pip install --extra-index-url $EXTRA_INDEX_URL -r ./requirements/base.txt

USER ${USERNAME}







