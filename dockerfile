# 1. Use a lightweight Java 21 runtime image
FROM eclipse-temurin:21-jre-alpine

# 2. Create a secure system group and user specific to sanidhya
RUN addgroup -S sanidhya-group && adduser -S sanidhya-user -G sanidhya-group

# 3. Set a clean application directory
WORKDIR /app

# 4. Copy your built JAR file into the container
COPY target/demo-application*.jar ./sanidhya.jar

# 5. Give the non-root user ownership of the application folder
RUN chown -R sanidhya-user:sanidhya-group /app

# 6. Set default environment variables for your application
ENV APPLICATION_NAME=sanidhya
ENV SPRING_PROFILES_ACTIVE=prod
ENV SERVER_PORT=8080

# 7. Expose the port
EXPOSE 8080

# 8. Switch to the secure non-root user
USER sanidhya-user

# 9. Run the sanidhya application jar
CMD ["java", "-jar", "sanidhya.jar"]
