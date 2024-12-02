FROM maven:3.8.4-openjdk-11 as build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline -B

COPY src ./src
RUN mvn package -DskipTests

FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/chatter.jar /app/chatter.jar
ENTRYPOINT ["java", "-jar", "/app/chatter.jar"]