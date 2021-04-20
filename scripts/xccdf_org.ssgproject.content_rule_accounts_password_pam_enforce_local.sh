#!/bin/bash

(>&2 echo "Remediating rule 63/227: 'xccdf_org.ssgproject.content_rule_accounts_password_pam_enforce_local'")
# Remediation is applicable only in certain platforms
if rpm --quiet -q pam; then

# skip these options in ubi <=8.3 as they aren't targeted to exist until 8.4
UBI_VERSION=$(sed -n -e '/VERSION_ID/ s/.*\= *//p' /etc/os-release | sed 's/"//g')
VERSION_CHECK=$(awk 'BEGIN{ print "'$UBI_VERSION'"<="'8.3'" }')
if [ "$VERSION_CHECK" -eq 1 ];then
    >&2 echo 'Remediation is not applicable for UBI <=8.3. Option is not targeted to exist until UBI 8.4.'
else

if [ -e "/etc/security/pwquality.conf" ] ; then
    LC_ALL=C sed -i "/^\s*local_users_only/Id" "/etc/security/pwquality.conf"
else
    touch "/etc/security/pwquality.conf"
fi

cp "/etc/security/pwquality.conf" "/etc/security/pwquality.conf.bak"
# Insert at the end of the file
printf '%s\n' "local_users_only" >> "/etc/security/pwquality.conf"
# Clean up after ourselves.
rm "/etc/security/pwquality.conf.bak"

### end of 8.3 check
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi

