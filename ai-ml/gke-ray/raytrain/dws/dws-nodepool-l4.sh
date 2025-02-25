export CLUSTER_NAME=rick-a3-mega-spot
export REGION=asia-northeast1
export ZONE=$REGION-b
export PREFIX=rick-a3-mega-spot-gpu
gcloud beta container node-pools create dws-l4-pool \
    --cluster=$CLUSTER_NAME \
    --node-locations $ZONE --region $REGION \
    --enable-queued-provisioning \
    --accelerator type=nvidia-l4,count=1,gpu-driver-version=latest \
    --machine-type=g2-standard-4 \
    --no-enable-autoupgrade \
    --scopes "https://www.googleapis.com/auth/cloud-platform" \
    --enable-autoscaling \
    --num-nodes=0 \
    --total-max-nodes 3 \
    --location-policy=ANY \
    --reservation-affinity=none \
    --no-enable-autorepair