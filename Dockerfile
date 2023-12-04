FROM alpine/git
WORKDIR /app
RUN git clone https://github.com/prathmeshrajmane/Multistage-Maven-Dockerfile.git

FROM maven:3.5-jdk-8-alpine
WORKDIR /app
COPY --from=0 /app/Multistage-Maven-Dockerfile /app 
RUN mvn install 

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=1 /app/target/ /app 
CMD ["java -jar jb-hello-world-maven-0.2.0.jar"]
