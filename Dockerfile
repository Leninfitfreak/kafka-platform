FROM confluentinc/cp-kafka:7.6.1

ARG JMX_EXPORTER_VERSION=1.0.1

USER root

RUN mkdir -p /opt/jmx-exporter /etc/jmx-exporter \
    && curl -fsSL -o /opt/jmx-exporter/jmx_prometheus_javaagent.jar \
    "https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/${JMX_EXPORTER_VERSION}/jmx_prometheus_javaagent-${JMX_EXPORTER_VERSION}.jar"

USER appuser
