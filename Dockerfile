# Ubuntu basic-DEV build

#---------------------------------------- BASE OS Environment

FROM ubuntu:20.04
LABEL maintainer="tincanbox"

# Envs
# * preventing locale selection and more interactive cli sections.
ENV DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-c"]

#--------------------
# Configuration
#--------------------

# default signinfo
ARG DEFAULT_GROUP=crew
ARG DEFAULT_GID=5000
ARG DEFAULT_USER=dev
ARG DEFAULT_UID=5001
ARG DEFAULT_PASSWORD="password"

# package
ARG PKG_UPDATE="apt-get update -y && apt-get install -y software-properties-common apt-utils"
ARG PKG_INSTALL="apt-get install -y"
ARG PKG_REQBASIS="build-essential gcc make cmake net-tools curl wget"


#--------------------
# Package Update
#--------------------

RUN eval "${PKG_UPDATE}"
RUN eval "apt-add-repository universe"
RUN eval "apt-add-repository ppa:neovim-ppa/unstable"
RUN eval "${PKG_INSTALL} ${PKG_REQBASIS}"

#--------------------
# User
#--------------------
# Adds default USER to sudoer group.

RUN ${PKG_INSTALL} sudo

# user default group
RUN addgroup --gid $DEFAULT_GID $DEFAULT_GROUP
RUN adduser --disabled-password --gecos "" --ingroup $DEFAULT_GROUP --uid $DEFAULT_UID $DEFAULT_USER
RUN adduser ${DEFAULT_USER} sudo
RUN echo "${DEFAULT_USER}:${DEFAULT_PASSWORD}" | chpasswd


#--------------------
# Dev Essentials
#--------------------


# shell
RUN ${PKG_INSTALL} zsh
# changing login shell...not required?
#RUN chsh -s /usr/bin/zsh ${DEFAULT_USER}

# Git
RUN ${PKG_INSTALL} git

# C#
# Java
# python
RUN ${PKG_INSTALL} python3-dev python3-pip

# node
RUN ${PKG_INSTALL} nodejs npm
RUN npm install -g npm n
RUN n stable
RUN apt-get purge -y nodejs npm
ENV PATH $PATH

# neovim
RUN ${PKG_INSTALL} neovim
RUN pip3 install --upgrade pynvim


#---------------------------------------- USERs Working Space

ARG INCUBATOR_VER=unknown

# changing working user and dir
USER $DEFAULT_USER
ENV HOME /home/${DEFAULT_USER}
WORKDIR $HOME

#--------------------
# Zsh modules
#--------------------
RUN git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

#--------------------
# Vim setup
#--------------------
# Caravan DOES vim handling...

#--------------------
# Caravan
#--------------------
RUN git clone https://github.com/tincanbox/caravan
RUN cd ./caravan && ./caravan init
RUN cd $HOME

#--------------------
# Space
#--------------------
RUN mkdir ~/space


CMD ["zsh"]