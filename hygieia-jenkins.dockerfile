FROM capitalone/hygieia-jenkins-build-collector:latest
COPY resources/jenkins/application.properties /hygieia/config/application.properties
COPY resources/jenkins/properties-builder.sh  /hygieia/
CMD chmod +x /hygieia/properties-builder.sh


WORKDIR /hygieia

ENV PROP_FILE /hygieia/config/application.properties

CMD /hygieia/properties-builder.sh && \
  java -jar jenkins-build-collector*.jar --spring.config.location=$PROP_FILE
 
