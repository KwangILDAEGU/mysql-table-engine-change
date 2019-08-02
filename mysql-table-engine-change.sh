#!/bin/bash

USER=""
PASSWORD=""
DATABASE=""

PREV_ENGINE=$1;
AFTER_ENGINE=$2;

IFS=$'\n' ARRAY=("mysql -u$USER -p$PASSWORD -D$DATABASE -e 'show tables'")

for VALUE in "${ARR[@]}"; do
    mysql -u$USER -p$PASSWORD -D$DATABASE -e "alter table $PREV_ENGINE engine=$AFTER_ENGINE;";

	if [[ $? == 0 ]]; then
		echo "<---- $VALUE Change Complete---->";
	fi
done