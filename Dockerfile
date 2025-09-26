FROM gradle:8-jdk17 AS build
COPY . /app
WORKDIR /app
RUN gradle build -x test

FROM amazoncorretto:17
WORKDIR /app
COPY --from=build /app/build/libs/*.jar /app/chatter.jar
EXPOSE 8080
CMD ["java", "-Dserver.port=${PORT:-8080}", "-jar", "/app/chatter.jar"]