#!/bin/sh
set -e

(>&2 echo "Remediating: 'xccdf_org.ssgproject.content_rule_accounts_password_minlen_login_defs'")

declare var_accounts_password_minlen_login_defs
var_accounts_password_minlen_login_defs="12"

grep -q ^PASS_MIN_LEN /etc/login.defs && \
sed -i "s/PASS_MIN_LEN.*/PASS_MIN_LEN\t$var_accounts_password_minlen_login_defs/g" /etc/login.defs
if ! [ $? -eq 0 ]
then
  echo -e "PASS_MIN_LEN\t$var_accounts_password_minlen_login_defs" >> /etc/login.defs
fi
