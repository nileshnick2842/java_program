# Stage 1 — Build
FROM eclipse-temurin:17 AS builder
WORKDIR /app
COPY helloworld.java .
RUN javac helloworld.java

# Stage 2 — Runtime
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=builder /app/helloworld.class .
EXPOSE 8080
CMD ["java","helloworld"]