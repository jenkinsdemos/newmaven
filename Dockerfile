FROM maven:3.5-jdk-8 as BUILD

COPY src /usr/src/myapp/src
COPY pom.xml /usr/src/myapp
RUN mvn -f /usr/src/myapp/pom.xml package

FROM tomcat:9.0 as DEPLOY

COPY --from=BUILD /usr/src/myapp/target/JenkinsWar.war /usr/local/tomcat/webapps/JenkinsWar.war
