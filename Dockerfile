FROM openjdk:8-jdk-alpine
COPY target/hello-charan.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
