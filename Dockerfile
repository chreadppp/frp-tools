FROM openjdk:8
#VOLUME /tmp

WORKDIR /app

ADD frp.jar /app/frp.jar
ADD lib /app/lib
ADD start.sh /app/start.sh
ADD application.yml BOOT-INF/classes/config/application.yml
#ENV DB_USER=frp DB_PORT=3306 DB_PASSWD=123456 DB_HOST=mysql SERVER_PORT=8899

#RUN bash -c 'touch /app.jar'
#ENTRYPOINT ["java","-Dloader.path=/lib", "-jar","/app.jar","$PARAMS"]
#ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
ENTRYPOINT ["sh", "-c", "/bin/bash start.sh"]
