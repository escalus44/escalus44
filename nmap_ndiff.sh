#credit The Hacker Playbook 3, with a few modifications
#1st time contributing. 

#!/bin/bash

mkdir /opt/nmap_diff
d=$(date +%Y-%m-%d)
y=$(date -d yesterday +%Y-%m-%d)
/usr/bin/nmap -p- -T4 -sV --script=banner -oX /opt/nmap_diff/scanrange_$d.xml 10.10.10.0/24 > /dev/nul>
if [ -e /opt/nmap_diff/raccorp_$y.xml];then
        /usr/bin/ndiff /opt/nmap_diff/raccorp_$y.xml
/opt/nmap_diff/scan_$d.xml > /opt/nmap_diff/dif.txt

echo -e "to: email@domain.com\nsubject: subject\n"| (cat - && uuencode /opt/nmap_diff raccorp_$y.xml) | ssmtp email@domain.com
fi
