# Build stage
FROM maven:3.8.6-eclipse-temurin-8 AS builder

WORKDIR /app

COPY . .

RUN mvn clean package -DskipTests


# Runtime stage
FROM eclipse-temurin:8-jre-alpine

WORKDIR /app

COPY --from=builder /app/target/users-api-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8083

ENV JWT_SECRET=PRFT
ENV SERVER_PORT=8083

CMD ["java", "-jar", "app.jar"]