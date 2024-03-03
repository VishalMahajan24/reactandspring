FROM maven:3.8.3-openjdk-17 AS build 
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim-buster
COPY --from=build /target/bootReact-0.0.1-SNAPSHOT.jar render.jar
EXPOSE 8080
ENTRYPOINT [ "java","-jar","bootReact.jar" ]  