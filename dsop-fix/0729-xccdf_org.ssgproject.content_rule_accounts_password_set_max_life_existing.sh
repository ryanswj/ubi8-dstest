(>&2 echo "Remediating rule 4/4: 'xccdf_org.ssgproject.content_rule_accounts_password_set_max_life_existing'")
sed -i 's/PASS_MAX_DAYS\t99999/PASS_MAX_DAYS    60/g' /etc/login.defs
