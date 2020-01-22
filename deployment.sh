cat << EOF | kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: $1
  labels:
    app: $1
spec:
  selector:
    matchLabels:
      app: $1
      tier: $1
  replicas: 2
  template:
    metadata:
      labels:
        app: $1
        tier: $1
    spec:
      containers:
      - name: $1
        image: $2
        ports:
        - containerPort: $3
EOF