(>&2 echo "Remediating rule 3/24: 'xccdf_org.ssgproject.content_rule_security_patches_up_to_date'")
yum update -y --disablerepo="*" --enablerepo="*ubi-8*"