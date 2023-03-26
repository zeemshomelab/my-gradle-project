FROM openjdk:8-jre-alpine

EXPOSE 8080
RUN mkdir /usr/app
#COPY ./build/libs/my-app-1.0-SNAPSHOT.jar /usr/app/
COPY build/libs/*.jar /usr/app/*.jar
WORKDIR /usr/app

#ENTRYPOINT ["java", "-jar", "my-app-1.0-SNAPSHOT.jar"]
ENTRYPOINT ["java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-Djava.security.egd=file:/dev/./urandom","-jar","/usr/app/*.jar"]


# FROM openjdk:8-jre-slim

# EXPOSE 8080

# RUN mkdir /app

# COPY build/libs/*.jar /usr/app/*.jar

# ENTRYPOINT ["java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-Djava.security.egd=file:/dev/./urandom","-jar","/usr/app/*.jar"]