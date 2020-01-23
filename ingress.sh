if [ $# -eq 0 ]; then
    echo "apply/delete name port"
    exit 1
fi
cat << EOF | kubectl $1 -f -
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: ingress-$2
  annotations:
    kubernetes.io/ingress.global-static-ip-name: ip-$2
    networking.gke.io/managed-certificates: cert-$2
spec:
  backend:
    serviceName: backend-$2
    servicePort: $3
EOF
