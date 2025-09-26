# Multi-stage build
FROM gradle:8-jdk21 AS build

# Copy source code
COPY . /app
WORKDIR /app

# Build the application
RUN gradle build -x test --no-daemon

# Production stage
FROM eclipse-temurin:21-jre

WORKDIR /app

# Copy the built JAR
COPY --from=build /app/build/libs/*.jar /app/chatter.jar

# Expose port
EXPOSE 8080

# Add health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080/actuator/health || exit 1

# Run the application
CMD ["java", "-Dserver.port=8080", "-jar", "/app/chatter.jar"]