# Используем официальный образ OpenJDK как базовый
FROM openjdk:21-jdk-slim AS build

# Устанавливаем рабочую директорию в контейнере
WORKDIR /app

# Копируем файлы проекта (pom.xml и исходники)
COPY pom.xml .
COPY src ./src

# Сборка проекта (будет создана папка target с JAR-файлом)
RUN mvn clean install -DskipTests

# Копируем готовый JAR-файл из папки target в новый образ
FROM openjdk:21-jdk-slim
WORKDIR /app
COPY --from=build /app/target/chatter.jar /app/chatter.jar

# Открываем порт для приложения
EXPOSE 8080

# Команда для запуска приложения
CMD ["java", "-jar", "chatter.jar"]