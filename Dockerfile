FROM maven:3.8.4-openjdk-11 AS builder

WORKDIR /app

COPY MyJavaAppOnAzure.java .

RUN javac MyJavaAppOnAzure.java

FROM openjdk:11-jre-slim

WORKDIR /app

COPY --from=builder /app/MyJavaAppOnAzure.class .

CMD ["java", "MyJavaAppOnAzure", "pushpavathi_dolla"]
