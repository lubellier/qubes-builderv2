FROM debian:stable
MAINTAINER Frédéric Pierret <frederic@invisiblethingslab.com>

# Install dependencies for Qubes Builder
RUN apt-get update && \
    apt-get install -y sudo curl debootstrap devscripts dpkg-dev git wget python3-debian e2fsprogs pbuilder \
    && apt-get clean all

RUN mkdir /builder /builder/plugins /builder/build /builder/distfiles

RUN useradd -m user -u 1000

RUN chown -R user /builder

RUN usermod -aG sudo user && echo '%sudo ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/sudo

USER user
