FROM openjdk:8-jre-slim
WORKDIR /app
COPY *.jar .
EXPOSE 8080
CMD ["/bin/sh", "-c", "java -jar /app/*.jar"]