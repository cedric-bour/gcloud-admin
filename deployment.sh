if [ $# -eq 0 ]; then
    echo "apply/delete name image port replicat"
    exit 1
fi
cat << EOF | kubectl $1 -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: $2
  labels:
    app: $2
spec:
  selector:
    matchLabels:
      app: $2
      tier: $2
  replicas: $5
  template:
    metadata:
      labels:
        app: $2
        tier: $2
    spec:
      containers:
      - name: image-$2
        image: $3
        ports:
        - containerPort: $4
EOF
