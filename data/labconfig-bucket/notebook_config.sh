echo "Current user: `id`" >> /tmp/notebook_config.log 2>&1
echo "Creating pub/sub subscriptions" >> /tmp/notebook_config.log 2>&1
gcloud pubsub subscriptions create "ff-tx-sub" --topic="ff-tx" --topic-project="cymbal-fraudfinder" >> /tmp/notebook_config.log 2>&1
gcloud pubsub subscriptions create "ff-tx-for-feat-eng-sub" --topic="ff-tx" --topic-project="cymbal-fraudfinder"
gcloud pubsub subscriptions create "ff-txlabels-sub" --topic="ff-txlabels" --topic-project="cymbal-fraudfinder" >> /tmp/notebook_config.log 2>&1
echo "Changing dir to /home/jupyter" >> /tmp/notebook_config.log 2>&1
cd /home/jupyter
echo "Cloning fraudfinder from github" >> /tmp/notebook_config.log 2>&1
su - jupyter -c "git clone https://github.com/GoogleCloudPlatform/fraudfinder.git" >> /tmp/notebook_config.log 2>&1
echo "Current user: `id`" >> /tmp/notebook_config.log 2>&1
echo "Installing python packages" >> /tmp/notebook_config.log 2&1
su - jupyter -c "pip install --upgrade --no-warn-conflicts --no-warn-script-location --user \
    google-cloud-pubsub==2.13.6 \
    google-api-core==2.8.2 \
    google-apitools==0.5.32 \
    plotly==5.10.0 \
    itables==1.2.0 \
    xgboost==1.6.2 \
    apache_beam==2.40.0 \
    plotly==5.10.0 \
    google-cloud-pipeline-components \
    kfp" >> /tmp/notebook_config.log 2>&1
