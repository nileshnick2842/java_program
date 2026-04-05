FROM openjdk:17-jdk-slim
WORKDIR /app
COPY helloworld.java .
RUN javac helloworld.java
EXPOSE 8080
CMD ["java","helloworld"]
