FROM ubuntu:16.04
MAINTAINER Rogier Slag <rogier@inventid.nl>

EXPOSE 8080
# The following files can be mapped into the container for usages towards Nagios
# However setting these as a volume causes Docker to create directories for them
# VOLUME ["/opt/status.dat", "/opt/nagios.cmd", "/opt/nagios.log"]

RUN apt-get update && \
    apt-get install python-virtualenv libffi-dev python-dev python-pip python-setuptools openssl libssl-dev -y
RUN cd /opt && \
    virtualenv env && \
    /opt/env/bin/pip install diesel && \
    /opt/env/bin/pip install requests

RUN mkdir /opt/nagios-api
COPY . /opt/nagios-api

CMD ["/opt/env/bin/python", "/opt/nagios-api/nagios-api", "-p", "8080", "-s", "/opt/status.dat", "-c", "/opt/nagios.cmd", "-l", "/opt/nagios.log", "-q"]

