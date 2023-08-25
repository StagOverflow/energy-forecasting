## Setting up a new VM

These are the manual steps required to setup a fresh VM for the project. These need to be scripted.

## git
sudo apt-get install git-all -y

### Repo
git clone https://github.com/StagOverflow/energy-forecasting.git
#poetry
curl -sSL https://install.python-poetry.org | python3 -

## pypi server
### Install dependencies.
```bash
sudo apt install -y apache2-utils
pip install passlib
```

### Create the credentials under the energy-forecasting name.
```bash
mkdir ~/.htpasswd
htpasswd -sc ~/.htpasswd/htpasswd.txt energy-forecasting
poetry config repositories.my-pypi http://localhost
poetry config http-basic.my-pypi energy-forecasting banana
```

## Docker
Manual docker install on a fresh VM

```bash
sudo apt update
sudo apt install --yes apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt update
sudo apt install --yes docker-ce

sudo usermod -aG docker $USER
```

## Upload env file
gcloud compute scp --recurse --zone northamerica-northeast2-a --quiet --tunnel-through-iap --project energy-consumption-396719 .env app:~/energy-forecasting/.env
