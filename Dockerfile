FROM maven:3.5.2-jdk-8-alpine AS MAVEN_BUILD

MAINTAINER MRITUNJAY SINGH

COPY pom.xml /build/
COPY src /build/src/

WORKDIR /build/
RUN mvn package

FROM openjdk:8-jre-alpine

WORKDIR AddNumbers

COPY --from=MAVEN_BUILD /build/target/addnumbers.jar /app/

ENTRYPOINT ["java", "-jar", "addnumbers.jar"]

EXPOSE 8003
