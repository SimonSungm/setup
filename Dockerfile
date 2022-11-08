FROM ubuntu:focal

COPY build/* /build/

RUN apt-get update && apt-get install -y locales sudo tzdata && \
	localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 && \
	ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
	rm -rf /var/lib/apt/lists/*

ENV LANG en_US.utf8

RUN /build/setup.sh
