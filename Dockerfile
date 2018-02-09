FROM ubuntu:16.04

RUN apt-get update -y && apt-get install -y supervisor wget curl htop software-properties-common python-software-properties vim less
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    add-apt-repository -y ppa:webupd8team/java && apt-get update -y && apt-get install -y oracle-java8-installer
RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.6.6.deb &&\
    dpkg -i elasticsearch-5.6.6.deb
RUN mkdir /data && chown elasticsearch:elasticsearch /data
RUN mkdir /etc/elasticsearch/master && mkdir /etc/elasticsearch/data

COPY master/ /etc/elasticsearch/master/
COPY data/ /etc/elasticsearch/data/

RUN chown -R elasticsearch:elasticsearch /etc/elasticsearch/

COPY supervisord.conf /etc/supervisor/supervisord.conf
COPY start.sh /start.sh
RUN chmod a+x /start.sh
#USER elasticsearch