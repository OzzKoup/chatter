
FROM openjdk:21-jdk-slim

WORKDIR /app

COPY build/libs/chatter-0.0.1-SNAPSHOT.jar /app/chatter.jar

EXPOSE 8080

# Run the application
CMD ["java", "-jar", "chatter.jar"]