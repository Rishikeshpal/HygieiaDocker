FROM capitalone/hygieia-bitbucket-scm-collector:latest
COPY resources/bitbucket/application.properties /hygieia/config/application.properties
COPY resources/bitbucket/properties-builder.sh  /hygieia/
CMD chmod +x /hygieia/properties-builder.sh


WORKDIR /hygieia

ENV PROP_FILE /hygieia/config/application.properties

CMD /hygieia/properties-builder.sh && \
  java -jar bitbucket-scm-collector*.jar --spring.config.location=$PROP_FILE
