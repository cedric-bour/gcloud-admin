if [ $# -eq 0 ]; then
    echo "name ip cert port"
    exit 1
fi
cat << EOF | kubectl apply -f -
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: $1
  annotations:
    kubernetes.io/ingress.global-static-ip-name: $2
    networking.gke.io/managed-certificates: $3
spec:
  backend:
    serviceName: $1-backend
    servicePort: $4
EOF