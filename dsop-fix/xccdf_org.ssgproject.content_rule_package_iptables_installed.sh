#!/bin/sh
set -e

(>&2 echo "Remediating: 'xccdf_org.ssgproject.content_rule_package_iptables_installed'")

if ! rpm -q --quiet "iptables" ; then
    dnf install -y --disablerepo='*' --enablerepo=ubi-8-appstream,ubi-8-baseos,ubi-8-codeready-builder "iptables"
fi
