# Multi-stage build для Railway
FROM gradle:8-jdk17 AS build

# Копіюємо весь проект
COPY . /app
WORKDIR /app

# Збираємо проект
RUN gradle build -x test

# Production stage
FROM openjdk:17-jre-slim

WORKDIR /app

# Копіюємо зібраний JAR з попереднього stage
COPY --from=build /app/build/libs/*.jar /app/chatter.jar

EXPOSE 8080

# Запускаємо додаток
CMD ["java", "-jar", "/app/chatter.jar"]