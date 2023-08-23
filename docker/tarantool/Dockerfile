FROM tarantool/tarantool:2.x-centos7

ENV TARANTOOL_INSTANCE_NAME=default
ENV TARANTOOL_USER_NAME=user
ENV TARANTOOL_USER_PASSWORD=password
USER root

ENV TZ=Europe/Moscow
ENV LANG ru_RU.utf8
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN yum update -y && yum install -y unzip cmake make npm shadow-utils.x86_64 cartridge-cli git bash sudo libpq gcc
RUN yum install -y gcc-c++
RUN cartridge gen completion --skip-bash --zsh="${fpath[1]}/_cartridge"
RUN luarocks install xml2lua

RUN yum -y install epel-release && yum -y groupinstall "Development Tools" && yum -y install readline-devel ncurses-devel && yum clean all

RUN curl -R -O http://www.lua.org/ftp/lua-5.3.5.tar.gz && tar -xzf lua-5.3.5.tar.gz && cd lua-5.3.5 && make linux test && make install && cd .. && rm -rf lua-5.3.5.tar.gz lua-5.3.5
    
RUN mkdir -p /home

RUN passwd -d tarantool
COPY .ssh /home/tarantool/.ssh
RUN chown -R tarantool:root /var/run/ /var/log/ /opt
RUN chown -R tarantool:tarantool /home/tarantool/ /usr/share/tarantool /var/log /var/lib/tarantool /var/run/tarantool

COPY entrypoint.cli.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN passwd -d root

USER tarantool

WORKDIR /usr/share/tarantool/currency-exchange

ENTRYPOINT [ "/entrypoint.sh" ]

