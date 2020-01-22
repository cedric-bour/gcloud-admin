if [ $# -eq 0 ]; then
    echo "apply/delete name domain"
    exit 1
fi
cat << EOF | kubectl $1 -f -
apiVersion: networking.gke.io/v1beta1
kind: ManagedCertificate
metadata:
  name: $2
spec:
  domains:
    - $3
EOF
