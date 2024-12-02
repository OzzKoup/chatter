# Use the official OpenJDK 21 runtime as the base image
FROM eclipse-temurin:21-jdk-jammy

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file from the target directory to the container
COPY target/chatter.jar chatter.jar

# Expose the application's default port (optional, specify if your app runs on a specific port)
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java", "-jar", "chatter.jar"]