FROM debian:bullseye-slim

MAINTAINER itmig@molindointigas.co.id

ENV DEBIAN_FRONTEND noninteractive
ENV USER_UID 1000
ENV USER_NAME itmig
ENV USER_HOME /home/itmig

RUN apt-get update && \
    useradd -ms /bin/bash -u $USER_UID $USER_NAME && \
    apt-get install -y --no-install-recommends --no-install-suggests apt-transport-https wget curl ca-certificates

COPY sources.list /etc/apt/

RUN apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /var/lib/log/* /tmp/* /var/tmp/*

CMD ["/bin/bash"]