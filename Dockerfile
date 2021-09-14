FROM alpine:latest

RUN apk add --no-cache openvpn openssl

#RUN wget https://torguard.net/downloads/OpenVPN-UDP.zip && \
#    unzip OpenVPN-UDP.zip

RUN wget https://torguard.net/downloads/OpenVPN-TCP-Linux.zip && \
    unzip OpenVPN-TCP-Linux.zip

WORKDIR /OpenVPN-TCP

COPY openvpn.sh /usr/local/bin/openvpn.sh
RUN chmod a+x /usr/local/bin/openvpn.sh 
COPY update-resolv-conf /etc/openvpn/update-resolv-conf
RUN chmod 777 /etc/openvpn/update-resolv-conf

ENV REGION="Netherlands"
ENTRYPOINT ["openvpn.sh"]
