FROM eclipse-temurin:21-jre

WORKDIR /opt

COPY target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
