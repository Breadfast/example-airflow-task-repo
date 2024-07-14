## Running Locally

Follow these steps to run your task locally

1. **Clone this Repository**

2. **Copy Paste this Repository elsewhere and Rename it**

3. **Open your repository in VSCode**

4. **Remove docs Folder**

This folder contains some screenshots for easier usage of the example-airflow-task-repo only.


5. **Open new Git Bash Terminal**

![Open New Terminal](docs/newTerminal.png)

![Select Git Bash Terminal](docs/openGitBash.png)


6. **Run the Provided Shell Script**

    This shell script does the following:
    - Sets google application default credentials (to be able to connect to gcloud apis locally)
    - Creates a Virtual Env in .venv directory 
    - Activates the Virtual Env in .venv directory
    - Installs required dependencies (listed in `requirements/base.txt`)

    ```bash
    . local-startup.sh
    ```

7.  **Run the Test Python Script to Ensure Correct Setup**

    ```bash
    python src/task.py
    ```
8. **Repeat Steps 5-6 whenever Needed**
