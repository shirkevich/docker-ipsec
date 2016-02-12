FROM ubuntu
RUN apt-get update && apt-get install -y strongswan
RUN groupadd vpn

RUN mkdir -p /etc/ipsec.d/conf && touch /etc/ipsec.d/conf/placeholder.conf
RUN mkdir -p /etc/ipsec.d/aacerts && mkdir -p /etc/ipsec.d/cacerts && mkdir -p /etc/ipsec.d/crls && mkdir -p /etc/ipsec.d/ocspcerts && mkdir -p /etc/ipsec.d/acerts
RUN echo "include /etc/ipsec.d/conf/*.conf" >> /etc/ipsec.conf

ADD ipsec_start /usr/local/bin/ipsec_start
ADD pipework /usr/local/bin/pipework

VOLUME /etc/ipsec.d

EXPOSE 500

ENTRYPOINT ["/usr/local/bin/ipsec_start"]
CMD []
