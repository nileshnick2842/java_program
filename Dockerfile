FROM eclipse-temurin:17
WORKDIR /app
COPY helloworld.java .
RUN javac helloworld.java
ADD https://raw.githubusercontent.com/nileshnick2842/java_program/master/config.txt /app/config.txt
EXPOSE 8080
CMD ["java", "helloworld"]

