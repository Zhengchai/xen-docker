FROM debian:stable

MAINTAINER Piotr Król <piotr.krol@3mdeb.com>

ENV DEBIAN_FRONTEND noninteractive

RUN \
	apt-get update && \
	apt-get install --assume-yes apt-utils && \
	apt-get -y install apt-transport-https ca-certificates 

ADD sources.list /etc/apt/

RUN \
	useradd -p locked -m xen && \
	apt-get update && \
	apt-get -y install \
		bcc \
		bin86 \
		bison \
		bridge-utils \
		build-essential \
		bzip2 \
		ccache \
		e2fslibs-dev \
		flex \
		gawk \
		gcc \
		gettext \
		git-core \
		iasl \
		iproute2 \
		libaio-dev \
		libbz2-dev \
		libc6-dev \
		libc6-dev-i386 \
		libcurl4 \
		libcurl4-openssl-dev \
		liblzma-dev \
		libncurses5-dev \
		libpixman-1-dev \
		libsdl-dev \
		libsystemd-dev \
		libvncserver-dev \
		libx11-dev \
		libyajl-dev \
		make \
		markdown \
		mercurial \
		ocaml \
		ocaml-findlib \
		pandoc \
		patch \
		pciutils-dev \
		python \
		python-dev \
		python-twisted \
		texinfo \
		texlive-fonts-extra \
		texlive-fonts-recommended \
		texlive-latex-base \
		texlive-latex-recommended \
		tgif \
		transfig \
		uuid-dev \
		wget \
		xz-utils \
		zlib1g-dev \
	&& apt-get clean

ENV PATH="/usr/lib/ccache:${PATH}"
RUN mkdir /home/xen/.ccache && \
	chown xen:xen /home/xen/.ccache

USER xen
