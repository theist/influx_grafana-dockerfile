FROM ubuntu

MAINTAINER Carlos Peñas <theistian@gmail.com>

ENV PRE_CREATE_DB **None**
ENV INFLUXDB_INIT_USER root
ENV INFLUXDB_INIT_PWD root

# Install Influx
RUN apt-get install -y wget
RUN wget http://influxdb.s3.amazonaws.com/influxdb_0.9.0_amd64.deb
RUN sudo dpkg -i influxdb_0.9.0_amd64.deb
RUN rm influxdb_0.9.0_amd64.deb

EXPOSE 80
EXPOSE 8083
EXPOSE 8086

