FROM eclipse-temurin:21-jre-alpine

# Create a non-root user and group
RUN addgroup -S sanidhya-group && \
    adduser -S sanidhya-user -G sanidhya-group

# Set application directory
WORKDIR /app

# Copy the Spring Boot executable JAR
COPY --chown=sanidhya-user:sanidhya-group target/sanidhya-0.0.1-SNAPSHOT.jar app.jar

# Use the non-root user
USER sanidhya-user

# Spring Boot runs on port 8080 by default
EXPOSE 8080

# Start the application
ENTRYPOINT ["java", "-jar", "app.jar"]
