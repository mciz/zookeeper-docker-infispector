FROM jboss/base-jdk:7
MAINTAINER tsykora
ENV ZOOKEEPER_VERSION 3.4.6
EXPOSE 2181 2888 3888 8084 
USER jboss
WORKDIR /opt/jboss
RUN curl http://apache.mirrors.pair.com/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/zookeeper-${ZOOKEEPER_VERSION}.tar.gz | tar -xzf - -C /opt/jboss/ \
    && mv /opt/jboss/zookeeper-${ZOOKEEPER_VERSION} /opt/jboss/zookeeper \
    && cp /opt/jboss/zookeeper/conf/zoo_sample.cfg /opt/jboss/zookeeper/conf/zoo.cfg 
COPY run.sh /opt/jboss/zookeeper/bin/
CMD ["/opt/jboss/zookeeper/bin/run.sh"]
