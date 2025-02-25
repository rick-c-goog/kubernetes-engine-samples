export CLUSTER_NAME=dws-cluster
export REGION=europe-west2
export ZONE=$REGION-b
gcloud container clusters create ${CLUSTER_NAME} \
    --addons=RayOperator \
    --cluster-version=${CLUSTER_VERSION}  \
    --machine-type=e2-standard-8 \
    --location=${COMPUTE_ZONE} \
    --num-nodes=2

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