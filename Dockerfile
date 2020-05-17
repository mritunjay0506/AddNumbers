FROM maven:3.5.2-jdk-8-alpine AS MAVEN_BUILD

MAINTAINER MRITUNJAY SINGH

COPY pom.xml /build/
COPY src /build/src/

WORKDIR /build/
RUN mvn package

FROM openjdk:8-jre-alpine

WORKDIR AddNumbers

COPY --from=MAVEN_BUILD /build/target/docker-boot-intro-0.1.0.jar

ENTRYPOINT ["java", "-jar", "docker-boot-intro-0.1.0.jar"]

EXPOSE 8003
