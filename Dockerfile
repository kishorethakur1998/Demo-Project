FROM openjdk:8-alpine
RUN apk update && apk add /bin/sh
RUN mkdir -p /opt/app
COPY target/*.jar /opt/app/spring-boot-mongo.jar
WORKDIR /opt/app
CMD ["java" , "-jar" , "./spring-boot-mongo.jar"]


