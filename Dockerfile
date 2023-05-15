FROM openjdk:17-jdk-slim
VOLUME /tmp
COPY target/deploy-spring-boot-to-local-k8s.jar app.jar
CMD [ "sh", "-c", "java -jar /app.jar" ]