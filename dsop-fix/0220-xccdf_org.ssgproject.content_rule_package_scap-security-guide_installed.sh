(>&2 echo "Remediating: 'xccdf_org.ssgproject.content_rule_package_scap-security-guide_installed'")

if ! rpm -q --quiet "scap-security-guide" ; then
    yum install -y "scap-security-guide"
fi
