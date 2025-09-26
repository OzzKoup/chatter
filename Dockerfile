# Multi-stage build для Railway
FROM gradle:8-jdk21 AS build

# Копіюємо весь проект
COPY . /app
WORKDIR /app

# Збираємо проект
RUN gradle build -x test

# Production stage
FROM eclipse-temurin:21-jre

WORKDIR /app

# Копіюємо зібраний JAR з попереднього stage
COPY --from=build /app/build/libs/*.jar /app/chatter.jar

EXPOSE 8080

# Запускаємо додаток з правильним портом для Railway
CMD ["java", "-Dserver.port=${PORT:-8080}", "-jar", "/app/chatter.jar"]