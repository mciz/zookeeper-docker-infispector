FROM jboss/base-jdk:7

MAINTAINER mciz

# USER root

ENV ZOOKEEPER_VERSION 3.4.6

EXPOSE 2181 2888 3888 8084 

RUN mkdir -p /opt/zookeeper && curl http://apache.mirrors.pair.com/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/zookeeper-${ZOOKEEPER_VERSION}.tar.gz | tar -xzf - -C /opt \
# && yum update -y \
# && yum install -y gettext && yum clean all \
    && mv /opt/zookeeper-${ZOOKEEPER_VERSION} /opt/zookeeper \
    && cp /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg 

WORKDIR /opt/zookeeper

COPY run.sh ./bin/

RUN chmod 755 /opt/zookeeper/bin/run.sh

# RUN chown -R jboss:0 /opt/zookeeper \
#    && chmod -R g+rw /opt/zookeeper

RUN chmod -R a=u /opt/zookeeper

# USER jboss

# VOLUME ["/opt/zookeeper/conf"]

CMD ["/opt/zookeeper/bin/run.sh"]
