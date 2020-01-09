FROM docker.elastic.co/logstash/logstash:7.5.1

RUN rm -f /usr/share/logstash/pipeline/logstash.conf
ADD ./files/config/logstash.yml /usr/share/logstash/config/logstash.yml
ADD ./files/pipeline/logstash.conf /usr/share/logstash/pipeline/logstash.conf
ADD ./files/docker-entrypoint.start.sh /usr/local/bin/docker-entrypoint.start.sh

#RUN for PLUGIN in $(/usr/share/logstash/bin/logstash-plugin list); do /usr/share/logstash/bin/logstash-plugin update $PLUGIN; done
RUN /usr/share/logstash/bin/logstash-plugin update logstash-input-beats

USER root
RUN chmod u+x /usr/local/bin/docker-entrypoint.start.sh
USER logstash

ENV ELK_ELASTICSEARCH_USERNAME="elastic" \
  ELK_ELASTIC_PASSWORD=""

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.start.sh"]
