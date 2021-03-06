FROM docker.io/library/maven:3.8.6-jdk-11 as builder
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package

#FROM openjdk:11
FROM arindamgb/openjdk11-alpine3.16
COPY --from=builder /usr/src/app/target/hello-world-0.0.1-SNAPSHOT.jar /usr/app/hello-world-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/usr/app/hello-world-0.0.1-SNAPSHOT.jar"]
