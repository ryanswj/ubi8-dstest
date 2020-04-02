#!/bin/sh
set -e

(>&2 echo "Remediating: 'xccdf_org.ssgproject.content_rule_package_crypto-policies_installed'")

if ! rpm -q --quiet "crypto-policies" ; then
    dnf install -y --disablerepo='*' --enablerepo=ubi-8-appstream-ib,ubi-8-baseos-ib,ubi-8-codeready-builder-ib "crypto-policies"
fi
