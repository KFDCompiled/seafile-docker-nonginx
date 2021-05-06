# See https://hub.docker.com/r/phusion/baseimage/tags/
FROM phusion/baseimage:0.11
ENV SEAFILE_SERVER=seafile-pro-server SEAFILE_VERSION=8.0.3

RUN apt-get update --fix-missing

# Utility tools
RUN apt-get install -y vim htop net-tools psmisc wget curl git

# For suport set local time zone.
RUN export DEBIAN_FRONTEND=noninteractive && apt-get install tzdata -y

#
RUN apt-get install -y libmysqlclient-dev

# Java
RUN apt-get install -y openjdk-8-jre

# Libreoffice
RUN apt-get install -y libreoffice libreoffice-script-provider-python libsm-dev
RUN apt-get install -y ttf-wqy-microhei ttf-wqy-zenhei xfonts-wqy

# Tools
RUN apt-get install -y zlib1g-dev pwgen openssl poppler-utils


# Python3
RUN apt-get install -y python3 python3-pip python3-setuptools python3-ldap python-rados
RUN python3.6 -m pip install --upgrade pip && rm -r /root/.cache/pip

RUN pip3 install --timeout=3600 click termcolor colorlog pymysql \
    django==2.2.* && rm -r /root/.cache/pip

RUN pip3 install --timeout=3600 future mysqlclient Pillow pylibmc captcha jinja2 \
    sqlalchemy django-pylibmc django-simple-captcha pyjwt && \
    rm -r /root/.cache/pip

RUN pip3 install --timeout=3600 boto oss2 pycryptodome twilio python-ldap configparser && \
    rm -r /root/.cache/pip


# Scripts
COPY scripts_7.1 /scripts
RUN chmod u+x /scripts/*

RUN mkdir -p /etc/my_init.d && \
    rm -f /etc/my_init.d/* && \
    cp /scripts/create_data_links.sh /etc/my_init.d/01_create_data_links.sh

# Seafile
WORKDIR /opt/seafile

RUN mkdir -p /opt/seafile/ && cd /opt/seafile/ && \
    wget -O seafile-pro-server_${SEAFILE_VERSION}_x86-64_Ubuntu.tar.gz \
    "https://download.seafile.com/d/6e5297246c/files/?p=/pro/seafile-pro-server_${SEAFILE_VERSION}_x86-64_Ubuntu.tar.gz&dl=1" && \
    tar -zxvf seafile-pro-server_${SEAFILE_VERSION}_x86-64_Ubuntu.tar.gz && \
    rm -f seafile-pro-server_${SEAFILE_VERSION}_x86-64_Ubuntu.tar.gz


EXPOSE 8000
EXPOSE 8082


CMD ["/sbin/my_init", "--", "/scripts/start.py"]
