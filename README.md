## Running Locally

Follow these steps to run your task locally


1. **Run the provided shell script**

    This shell script does the following:
    - Sets google application default credentials (to be able to connect to gcloud apis locally)
    - Creats a Virtual Env in .venv directory 
    - Activates the Virtual Env in .venv directory
    - Installs required dependencies (listed in `requirements/base.txt`)

    ```bash
    . local-startup.sh
    ```

2.  **Run your python script**

    ```bash
    python src/task.py
    ```