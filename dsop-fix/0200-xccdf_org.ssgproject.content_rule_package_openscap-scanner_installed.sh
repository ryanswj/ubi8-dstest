(>&2 echo "Remediating: 'xccdf_org.ssgproject.content_rule_package_openscap-scanner_installed'")

if ! rpm -q --quiet "openscap-scanner" ; then
    yum install -y "openscap-scanner"
fi
