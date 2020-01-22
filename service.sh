if [ $# -eq 0 ]; then
    echo "name port"
    exit 1
fi
cat << EOF | kubectl apply -f -
apiVersion: v1
kind: Service
metadata:
  name: $1-backend
spec:
  type: NodePort
  ports:
    - port: $2
      targetPort: $2
  selector:
    app: $1
    tier: $1
EOF