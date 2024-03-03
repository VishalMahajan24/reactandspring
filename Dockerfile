FROM maven:3.8.3-openjdk-17 AS build
COPY . . 
RUN mvn clean package -DskipTests

# FROM node:20-alpine
# WORKDIR /app
# ENV PATH /app/node_modules/.bin:$PATH
# COPY package.json .
# COPY package-lock.json .
# RUN npm install # -g npm@8.18.0
# COPY . .
# EXPOSE 3000
# CMD ["npm", "start"]

FROM openjdk:17-jdk-slim-buster
COPY --from=build /target/bootReact-0.0.1-SNAPSHOT.jar bootRact.jar
EXPOSE 8080
ENTRYPOINT [ "java","jar","bootRact.jar" ]