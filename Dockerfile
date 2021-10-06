FROM openjdk:11

ADD target /app

EXPOSE 8080

WORKDIR /app

ENTRYPOINT ["java", "-jar", "test.war"]
