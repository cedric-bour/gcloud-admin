if [ $# -eq 0 ]; then
    echo "name port replicas"
    exit 1
fi
gcloud container clusters create cluster-$1 --num-nodes=3 -m g1-small
gcloud container clusters get-credentials cluster-$1
sh ./deployment.sh apply $1 eu.gcr.io/app1-265921/image-$1 $2 $3
sh ./service.sh apply $1 $2
sh ./cert.sh apply $1 $1.gcloud.cedric-bour.fr
sh ./ingress.sh apply $1 $2
