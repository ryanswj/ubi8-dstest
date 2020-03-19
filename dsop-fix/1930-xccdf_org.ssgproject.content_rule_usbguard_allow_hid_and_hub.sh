(>&2 echo "Remediating: 'xccdf_org.ssgproject.content_rule_usbguard_allow_hid_and_hub'")
#!/bin/bash


echo "allow with-interface match-all { 03:*:* 09:00:* }" >> /etc/usbguard/rules.conf
