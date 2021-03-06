FROM maven:3.5.2-jdk-8-alpine AS MAVEN_BUILD

MAINTAINER MRITUNJAY SINGH

COPY pom.xml /build/
COPY src /build/src/

WORKDIR /build/
RUN mvn package

FROM openjdk:8-jre-alpine

WORKDIR AddNumbers

ADD /target/AddNumbers-0.0.1-SNAPSHOT.jar AddNumbers-0.0.1-SNAPSHOT.jar

ENTRYPOINT ["java", "-jar", "AddNumbers-0.0.1-SNAPSHOT.jar"]

EXPOSE 8003
