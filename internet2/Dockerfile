FROM debian:buster-slim

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y iproute2 bird iputils-ping && rm -rf /var/lib/dpkg/lists && mkdir /run/bird

ADD ep.sh /

CMD /ep.sh
