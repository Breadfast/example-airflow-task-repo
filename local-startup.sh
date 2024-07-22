
: '
This shell script does the following:
- Sets google application default credentials (to be able to connect to gcloud apis locally)
- Creates a Virtual Env in .venv directory 
- Activates the Virtual Env in .venv directory
'
CREDENTIALS_PATH="$HOME/.config/gcloud/application_default_credentials.json"

if [ -f "$CREDENTIALS_PATH" ]; then
    echo "$CREDENTIALS_PATH already exists."
else
    gcloud auth application-default login
fi

export GOOGLE_APPLICATION_CREDENTIALS="$CREDENTIALS_PATH"

if [ -d ".venv" ]; then
    echo ".venv already exists."
else
    python -m venv .venv
fi
. .venv/bin/activate

pip install --upgrade pip 
