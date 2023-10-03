## Next steps

 * Run everything
 * Use a different data source
 * Replace wandb with mlflow
 * Replace docker compose with kubernetes
 * Replace hopswork with feast
 * Replace fastapi with flask
 * Separate pypi server from airflow
 * Mess around with the airflow DAG, this one looks wrong to me
 * Implement recommendations in 8
 * automate VM setup
 * Docker publish instead of pypi server
 * Manage env vars better
 * Give the image build script a second pass
 * Use a secret vault instead of environment variables

next up: 
1. ~~create the docker image for feature-pipeline~~
2. ~~create a gcs container registry~~
3. ~~push image there~~
4. have airflow pick it up and run it
5. Apply that to the remaining pipelines steps

Feast: replace hopsworks with feast
Wandb: replace wandb with mlflow


# Note on GCP setup

Package signing seems required, but apt-key is deprecated and we need to use 
trusted.gpg.d https://itsfoss.com/apt-key-deprecated/

This means the instructions on the google website are wrong partially (https://cloud.google.com/sdk/docs/install#deb),
the correct steps are:

 * ```sudo apt-get update```
 * ```sudo apt-get install apt-transport-https ca-certificates gnupg curl sudo```
 * ```curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/spotify.gpg``` 
 * ```echo "deb [signed-by=/etc/apt/trusted.gpg.d/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list```
 * sudo apt-get update && sudo apt-get install google-cloud-cli
