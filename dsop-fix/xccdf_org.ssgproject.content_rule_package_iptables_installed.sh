#!/bin/sh
set -e

(>&2 echo "Remediating: 'xccdf_org.ssgproject.content_rule_package_iptables_installed'")

if ! rpm -q --quiet "iptables" ; then
    dnf install -y --disablerepo='*' --enablerepo=ubi-8-appstream-ib,ubi-8-baseos-ib,ubi-8-codeready-builder-ib "iptables"
fi
