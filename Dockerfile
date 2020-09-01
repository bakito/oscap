FROM fedora:latest

RUN dnf install -y openscap-scanner scap-security-guide cmake make python3-pyyaml python3-jinja2 python3-pytest \
    python3-pytest-cov dbus-devel GConf2-devel libacl-devel libblkid-devel libcap-devel libcurl-devel libgcrypt-devel \
    libselinux-devel libxml2-devel libxslt-devel libattr-devel make openldap-devel pcre-devel perl-XML-Parser \
    perl-XML-XPath perl-devel python-devel rpm-devel swig bzip2-devel gcc gcc-c++ which sendmail postfix \
    && dnf clean all \
    && rm -rf /var/cache/yum

USER 1001