apiVersion: apps/v1
kind: Deployment
metadata:
  name: guestbook-service
  labels:
    app: guestbook-service
    visualize: "true"
spec:
  replicas: 2
  selector:
    matchLabels:
      app: guestbook-service
  template:
    metadata:
      labels:
        app: guestbook-service
        version: "latest"
        visualize: "true"
      annotations:
        visualizer/uses: mysql
    spec:
      containers:
      - name: guestbook-service
        image: AWS_ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/AWS_REPO_PREFIX-guestbook:latest
        imagePullPolicy: Always
        env:
          - name: DB_HOST
            value: mysql
          - name: DB_USER
            value: root
          - name: DB_PASS
            value: yourpassword
        ports:
        - name: http
          containerPort: 8080
        resources:
          requests:
            cpu: "100m"
          limits:
            cpu: "500m"
