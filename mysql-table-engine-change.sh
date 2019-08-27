#!/bin/bash

USER=""
PASSWORD=""
DATABASE=""

AFTER_ENGINE=$2;

IFS=$'\n' ARRAY=(`mysql -u$USER -p$PASSWORD -D$DATABASE -e 'show tables' | grep -v 'Tables_in_$DATABASE'`)

for VALUE in "${ARRAY[@]}"; do
    mysql -u$USER -p$PASSWORD -D$DATABASE -e "alter table $VALUE engine=$AFTER_ENGINE;";

	if [[ $? == 0 ]]; then
		echo "<---- $VALUE Change Complete---->";
	fi
done