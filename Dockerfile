FROM openjdk:17
WORKDIR /app
COPY helloworld.java .
RUN javac helloworld.java
EXPOSE 8080
CMD ["java","helloworld"]
