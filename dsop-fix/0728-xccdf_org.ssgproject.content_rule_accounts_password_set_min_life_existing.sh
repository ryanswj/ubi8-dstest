(>&2 echo "Remediating rule 3/4: 'xccdf_org.ssgproject.content_rule_accounts_password_set_min_life_existing'")
sed -i 's/PASS_MIN_DAYS\t0/PASS_MIN_DAYS    1/g' /etc/login.defs
