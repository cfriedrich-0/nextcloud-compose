#!/bin/bash

set -euxo pipefail

case $1 in
	start )
		docker-compose up -d
		;;
	stop )
		docker-compose down
		;;
	restart )
		docker-compose restart
		;;
	cron )
		docker-compose exec -d -u www-data nextcloud php cron.php
		;;
	occ )
		docker-compose exec -u www-data nextcloud php occ ${@:2}
		;;
esac
