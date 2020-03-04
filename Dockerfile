FROM registry.access.redhat.com/ubi8/ubi:8.1

LABEL name="ubi8"
LABEL version="8.1"
LABEL com.redhat.license_terms="https://www.redhat.com/licenses/eulas"

COPY dsop-fix*.sh /

RUN rm /etc/yum.repos.d/ubi.repo && \
    chmod +x /dsop-fix-{1,2}.sh && for i in $(ls /dsop-fix-{1,2}.sh); do sh ${i}; done && \
    yum repolist --disablerepo=* --enablerepo=*ubi-8* && \
    yum update -y --disablerepo=* --enablerepo=*ubi-8* && \
    yum clean all && \
    chmod +x /dsop-fix-3.sh && for i in $(ls /dsop-fix-3.sh); do sh ${i}; done && rm -rf /dsop-fix*.sh && \
    rm -rf /var/cache/yum/ /var/tmp/* /tmp/* /var/tmp/.???* /tmp/.???*

ENV container oci
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Purposely not setting USER as this is a builder image 
HEALTHCHECK --timeout=30s CMD curl -f http://localhost:80 || exit 1
CMD ["/bin/bash"]
