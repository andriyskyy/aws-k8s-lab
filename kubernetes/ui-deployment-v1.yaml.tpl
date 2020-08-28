apiVersion: apps/v1
kind: Deployment
metadata:
  name: ui
  labels:
    app: ui
    visualize: "true"
spec:
  replicas: 2
  selector:
    matchLabels:
      app: ui
  template:
    metadata:
      labels:
        app: ui
        version: "1.0"
        visualize: "true"
      annotations:
        visualizer/uses: message-service,guestbook-service,redis
    spec:
      containers:
      - name: ui
        image: AWS_ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/AWS_REPO_PREFIX-ui:v1
        env:
          - name: MESSAGE_HOST
            value: http://message-service:8080
          - name: GUESTBOOK_HOST
            value: http://guestbook-service:8080
          - name: REDIS_HOST
            value: redis
        readinessProbe:
          httpGet:
            path: /
            port: 8080
        ports:
        - name: http
          containerPort: 8080
