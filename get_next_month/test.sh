#!/bin/bash

NEXT_MONTH=$(date -d "1 month" +'%Y-%m')
TABLE_NAME="shourt_urls_$NEXT_MONTH"
echo "TableName: $TABLE_NAME"

DB_HOST="127.0.0.1"
DB_PORT="3306"
ACCOUNT_ID="sa"
ACCOUNT_PWD=""
DEFAULT_DATABASE=""

func() {
    echo "Usage: xx.sh [-h DB_HOST] [-P DB_PORT] [-u ACCOUNT_ID] [-p ACCOUNT_PWD] [-d DEFAULT_DATABASE]"
    exit -1
}


while getopts 'h:P:d:u:p:' OPT; do
	case $OPT in
		h) DB_HOST="$OPTARG";;
		P) DB_PORT="$OPTARG";;
		u) ACCOUNT_ID="$OPTARG";;
		p) ACCOUNT_PWD="$OPTARG";;
		d) DEFAULT_DATABASE="$OPTARG";;
		?) func;;
	esac
done


CREATE_TABLE_SQL="CREATE TABLE IF NOT EXISTS \`$TABLE_NAME\`  (\`id\` bigint(20) unsigned NOT NULL,\`original_url\` varchar(4000) NOT NULL,\`short_url\` varchar(10) NOT NULL,\`created\` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, PRIMARY KEY (\`id\`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;"

mysql -h "$DB_HOST" -P "$DB_PORT" --user="$ACCOUNT_ID" --password="$ACCOUNT_PWD"  -D "$DEFAULT_DATABASE" -e "$CREATE_TABLE_SQL" 

