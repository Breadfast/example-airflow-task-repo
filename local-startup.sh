
: '
This shell script does the following:
- Sets google application default credentials (to be able to connect to gcloud apis locally)
- Creates a Virtual Env in .venv directory 
- Activates the Virtual Env in .venv directory
- (Commented Out)Installs private hosted package dependencies (listed in `requirements/base.txt`) 
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

# pip install keyrings.google-artifactregistry-auth==1.1.2



# AUTHED_ARTIFACT_REG_URL=https://oauth2accesstoken:$(gcloud auth print-access-token)@europe-north1-python.pkg.dev/followbreadfast/bf-data-py-packages/simple/
# pip install --extra-index-url $AUTHED_ARTIFACT_REG_URL -r ./requirements/base.txt