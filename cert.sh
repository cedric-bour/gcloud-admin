if [ $# -eq 0 ]; then
    echo "name domain"
    exit 1
fi
cat << EOF | kubectl apply -f -
apiVersion: networking.gke.io/v1beta1
kind: ManagedCertificate
metadata:
  name: $1
spec:
  domains:
    - $2
EOF