FROM fedora:latest

RUN dnf install -y openscap-scanner scap-security-guide cmake make python3-pyyaml python3-jinja2 python3-pytest \
    python3-pytest-cov \
    && dnf clean all \
    && rm -rf /var/cache/yum

#USER 1001