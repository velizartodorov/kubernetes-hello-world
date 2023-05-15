FROM openjdk:17-jdk-slim
VOLUME /tmp
COPY target/kubernetes-hello-world.jar app.jar
CMD [ "sh", "-c", "java -jar /app.jar" ]