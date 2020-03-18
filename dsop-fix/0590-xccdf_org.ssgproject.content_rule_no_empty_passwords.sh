(>&2 echo "Remediating rule 1/24: 'xccdf_org.ssgproject.content_rule_no_empty_passwords'")
sed --follow-symlinks -i 's/\<nullok\>//g' /etc/pam.d/system-auth
sed --follow-symlinks -i 's/\<nullok\>//g' /etc/pam.d/password-auth