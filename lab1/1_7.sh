#!/bin/bash

email_pattern="[a-zA-Z0-9._]\+@[a-zA-Z0-9.]\+\.[a-zA-Z0-9.]\+"
email_list=$(grep -Rohs $email_pattern /etc | grep -o $email_pattern)
echo $email_list | sed 's/ /, /g' > emails.lst
