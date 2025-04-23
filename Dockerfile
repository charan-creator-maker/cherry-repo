# Use official Tomcat base image
FROM tomcat:9.0

# Optional: Clean default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file into the webapps folder
COPY target/mywebapp-1.0.war /usr/local/tomcat/webapps/ROOT.war

# Expose the Tomcat port
EXPOSE 8080


