# Stage 1 — Build
FROM eclipse-temurin:17 AS builder
WORKDIR /app
COPY helloworld.java .
RUN javac helloworld.java
ADD https://github.com/.../config.txt /app/config.txt  # ← can keep this!

# Stage 2 — Runtime
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=builder /app/helloworld.class .
COPY --from=builder /app/config.txt .    # ← copy config too!
EXPOSE 8080
CMD ["java", "helloworld"]
