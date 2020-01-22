if [ $# -eq 0 ]; then
    echo "apply/delete name port"
    exit 1
fi
cat << EOF | kubectl $1 -f -
apiVersion: v1
kind: Service
metadata:
  name: $2-backend
spec:
  type: NodePort
  ports:
    - port: $3
      targetPort: $3
  selector:
    app: $2
    tier: $2
EOF
