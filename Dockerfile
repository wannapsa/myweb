# Use official base image of Java Runtim
FROM openjdk:8-jdk-alpine

# Set volume point to /tmp
VOLUME /tmp

# Make port 8080 available to the world outside container
EXPOSE 8080

# Set application's JAR file
ARG JAR_FILE=target/myweb-tasks.war

# Add the application's JAR file to the container
ADD ${JAR_FILE} ROOT.war

# Run the JAR file
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/ROOT.war"]