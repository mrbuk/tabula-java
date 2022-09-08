FROM ubuntu:rolling as download
RUN apt-get update && apt-get -y install wget
WORKDIR /tmp/download/
RUN wget https://github.com/tabulapdf/tabula-java/releases/download/v1.0.5/tabula-1.0.5-jar-with-dependencies.jar

FROM eclipse-temurin:18.0.2.1_1-jdk-jammy
RUN mkdir /app
COPY --from=download /tmp/download/ /app/
ENTRYPOINT ["java", "-jar", "/app/tabula-1.0.5-jar-with-dependencies.jar"]