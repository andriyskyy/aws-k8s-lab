apiVersion: apps/v1
kind: Deployment
metadata:
  name: message-service
  labels:
    app: message-service
    visualize: "true"
spec:
  replicas: 2
  selector:
    matchLabels:
      app: message-service
  template:
    metadata:
      labels:
        app: message-service
        version: "2.0"
        visualize: "true"
    spec:
      containers:
      - name: message-service
        image: AWS_ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/AWS_REPO_PREFIX-message:v2
        resources:
          requests:
            cpu: 200m
            memory: 128Mi
          limits:
            cpu: 500m
            memory: 512Mi
        ports:
        - name: http
          containerPort: 8080
