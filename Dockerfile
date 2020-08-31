FROM fedora:latest

RUN dnf install openscap-scanner scap-security-guide cmake make python3-pyyaml python3-jinja2 -y \
 && dnf clean all \
 && rm -rf /var/cache/yum

USER 1001