#!/bin/sh
set -e

(>&2 echo "Remediating: 'xccdf_org.ssgproject.content_rule_package_sudo_installed'")

if ! rpm -q --quiet "sudo" ; then
    dnf install -y --disablerepo='*' --enablerepo=ubi-8-appstream-ib,ubi-8-baseos-ib,ubi-8-codeready-builder-ib "sudo"
fi
