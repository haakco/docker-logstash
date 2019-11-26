FROM docker.elastic.co/logstash/logstash:7.4.2

RUN rm -f /usr/share/logstash/pipeline/logstash.conf
ADD ./files/config/logstash.yml /usr/share/logstash/config/logstash.yml
ADD ./files/pipeline /usr/share/logstash/pipeline

#RUN for PLUGIN in $(/usr/share/logstash/bin/logstash-plugin list); do /usr/share/logstash/bin/logstash-plugin update $PLUGIN; done
RUN /usr/share/logstash/bin/logstash-plugin update logstash-input-beats
