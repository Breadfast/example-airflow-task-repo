## Motivation 

This repo is aimed to be a template for creating an airflow task (*can be extended to any python task not just for airflow*) that needs to be packaged as a docker image and run in a container on a Kubernetes Pod.

## Contents

1. [`README.md`](README.md) folder for documentation.
2. Template [`gitignore`](.gitignore) file.
3. Template [`requirements/base.txt`](requirements/base.txt) file for listing python package dependencies.
4. Template [`src/task.py`](src/task.py) file for writing the main python code.
5. Template [`Dockerfile`](Dockerfile) for building the repo as Docker image.
6. Template [`docker-compose.yaml`](docker-compose.yaml) for running the docker image.
7. Template [`cloudbuild.yaml`](cloudbuild.yaml) that references [`Dockerfile`](Dockerfile) and build this Dockerfile into a Docker image then pushes it to our Google Artifact Registry. 
8. Template [`scripts`](scripts/) folder for spinning up and down docker containers of the development environment
9. [`.env.sample`](.env.sample) file containing needed environment variables to be set when running locally with Docker. 
## Usage

To use this template repo you can clone it locally. Then *copy/paste* it elsewhere, *rename* it and *edit* it as fits your needs.

## Local Development


To Run [`src/task.py`](src/task.py) follow these steps:

### Running in a Docker container

1. Copy [`.env.sample`](.env.sample) file into a new `.env` file and set the included environment variables.

2. Build the Docker image and run the container 
    ```bash
    . scripts/dev/start-docker.bash
    ```
3. Stop the container when needed
    ```bash
    . scripts/dev/start-docker.bash
    ```
    

### Running without Docker

1. Run the following commands to install dependencies including private python packages (e.g. [pybq](https://github.com/Breadfast/pybq))

    ```bash
    pip install keyrings.google-artifactregistry-auth==1.1.2

    pip install --extra-index-url https://oauth2accesstoken:$(gcloud auth print-access-token)@europe-north1-python.pkg.dev/followbreadfast/bf-data-py-packages/simple/ -r requirements/base.txt
    ```


