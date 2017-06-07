FROM anapsix/alpine-java:8u131b11_server-jre

ENV BMP_VERSION 2.1.4
RUN apk add --no-cache --virtual=build-dependencies wget openssl \
    && wget -O browsermob-proxy.zip https://github.com/lightbody/browsermob-proxy/releases/download/browsermob-proxy-$BMP_VERSION/browsermob-proxy-$BMP_VERSION-bin.zip \
    && unzip -q /browsermob-proxy.zip \
    && rm -f /browsermob-proxy.zip \
	&& mv /browsermob-proxy-$BMP_VERSION /browsermob-proxy

ENV BMP_PORT 8080
ENV PORT_RANGE 8081-8081
ENV JAVA_OPTS "-Djsse.enableSNIExtension=false"

CMD /browsermob-proxy/bin/browsermob-proxy -port $BMP_PORT -proxyPortRange $PORT_RANGE