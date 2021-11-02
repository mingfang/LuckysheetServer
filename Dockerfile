FROM maven:3-jdk-8 as build

WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline -N

COPY . .
RUN mvn package

FROM openjdk:8-jre-slim as final
ENV LANG=C.UTF-8

COPY --from=build /app/luckysheet/target/web-lockysheet-postgres.jar /app/app.jar

WORKDIR /app
CMD java -jar app.jar