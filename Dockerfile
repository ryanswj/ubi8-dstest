# use image from download.json
FROM ubi8:oss8.1

LABEL name="ubi8"
LABEL version="8.1"
LABEL com.redhat.license_terms="https://www.redhat.com/licenses/eulas"

COPY dsop-fix /dsop-fix/

RUN rm /etc/yum.repos.d/ubi.repo && \
    yum repolist && \
    yum update -y && \
    for f in /dsop-fix/*.sh ; do sh "$f"; done && \
    yum clean all && \
    rm -rf /dsop-fix/ /var/cache/yum/ /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

ENV container oci
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Purposely not setting USER as this is a builder image 
HEALTHCHECK --timeout=30s CMD curl -f http://localhost:80 || exit 1
CMD ["/bin/bash"]
