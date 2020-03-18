(>&2 echo "Remediating rule 4/24: 'xccdf_org.ssgproject.content_rule_accounts_minimum_age_login_defs'")

var_accounts_minimum_age_login_defs="1"

grep -q ^PASS_MIN_DAYS /etc/login.defs && \
  sed -i "s/PASS_MIN_DAYS.*/PASS_MIN_DAYS     $var_accounts_minimum_age_login_defs/g" /etc/login.defs
if ! [ $? -eq 0 ]; then
    echo "PASS_MIN_DAYS      $var_accounts_minimum_age_login_defs" >> /etc/login.defs
fi