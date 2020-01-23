if [ $# -eq 0 ]; then
    echo "name"
    exit 1
fi
gcloud container clusters delete cluster-$1
