#!/bin/bash

(>&2 echo "Remediating rule 75/227: 'xccdf_org.ssgproject.content_rule_use_pam_wheel_for_su'")
#!/bin/bash

# uncomment the option if commented
  sed '/^[[:space:]]*#[[:space:]]*auth[[:space:]]\+required[[:space:]]\+pam_wheel\.so[[:space:]]\+use_uid$/s/^[[:space:]]*#//' -i /etc/pam.d/su

