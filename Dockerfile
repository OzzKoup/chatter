# Use the official OpenJDK 21 image as a base image
FROM openjdk:21-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy your application's compiled JAR file into the container
COPY build/libs/chatter-0.0.1-SNAPSHOT.jar /app/chatter.jar

# Expose the port that your application will run on
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "chatter.jar"]