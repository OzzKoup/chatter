FROM gradle:8-jdk21 AS build

COPY . /app
WORKDIR /app

RUN gradle build -x test --no-daemon

FROM eclipse-temurin:21-jre

WORKDIR /app

COPY --from=build /app/build/libs/*.jar /app/chatter.jar

EXPOSE 8080

CMD ["java", "-Dserver.port=8080", "-jar", "/app/chatter.jar"]