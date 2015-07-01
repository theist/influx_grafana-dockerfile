FROM ubuntu

MAINTAINER Carlos Peñas <theistian@gmail.com>

ENV PRE_CREATE_DB **None**
ENV INFLUXDB_INIT_USER root
ENV INFLUXDB_INIT_PWD root

RUN apt-get update

# Install Influx
RUN apt-get install -y wget
RUN wget http://influxdb.s3.amazonaws.com/influxdb_0.9.0_amd64.deb
RUN dpkg -i influxdb_0.9.0_amd64.deb
RUN rm influxdb_0.9.0_amd64.deb
ADD influxdb.conf /etc/opt/influxdb/influxdb.conf

# Install Grafana

RUN apt-get install -y adduser libfontconfig
RUN wget https://grafanarel.s3.amazonaws.com/builds/grafana_2.0.2_amd64.deb
RUN sudo dpkg -i grafana_2.0.2_amd64.deb
RUN rm grafana_2.0.2_amd64.deb
ADD grafana.ini /etc/grafana/grafana.ini

# Install supervisor

RUN apt-get install -y supervisor

EXPOSE 80
EXPOSE 8083
EXPOSE 8086

