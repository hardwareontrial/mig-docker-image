FROM mig:debian11.1

MAINTAINER itmig@molindointigas.co.id
RUN apt-get update && apt-get install -y --no-install-recommends --no-install-suggests nginx

RUN unlink /etc/nginx/sites-enabled/default

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]