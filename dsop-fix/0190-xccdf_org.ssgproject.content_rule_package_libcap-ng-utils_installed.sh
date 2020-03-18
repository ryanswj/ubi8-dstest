(>&2 echo "Remediating: 'xccdf_org.ssgproject.content_rule_package_libcap-ng-utils_installed'")

if ! rpm -q --quiet "libcap-ng-utils" ; then
    yum install -y "libcap-ng-utils"
fi
