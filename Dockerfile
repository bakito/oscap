FROM fedora:latest as builder

RUN yum install -y \
    cmake dbus-devel GConf2-devel libacl-devel libblkid-devel libcap-devel libcurl-devel \
    libgcrypt-devel libselinux-devel libxml2-devel libxslt-devel libattr-devel make openldap-devel \
    pcre-devel perl-XML-Parser perl-XML-XPath perl-devel python-devel rpm-devel swig \
    bzip2-devel gcc-c++ libyaml-devel git python3-pyyaml python3-jinja2 python3-pytest \
    && dnf clean all \
    && rm -rf /var/cache/yum
RUN cd /tmp \
  && git clone --recurse-submodules https://github.com/OpenSCAP/openscap.git \
  && cd openscap/build \
  && cmake ../ \
  && make \
  && make oscap-chrootable \
  && make install \
  && make clean \
  && rm -Rf /tmp/openscap

USER 1001

#RUN cd /tmp &&  git clone https://github.com/ComplianceAsCode/content.git