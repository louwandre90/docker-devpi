FROM python:3.6
MAINTAINER Andre Louw <louwandre90@gmail.com>

RUN apt-get -y update && apt-get install -y netbase python3-pip
RUN pip install devpi-server devpi-client devpi-web requests
VOLUME /mnt
EXPOSE 3141
ADD run.sh /
CMD ["/run.sh"]
