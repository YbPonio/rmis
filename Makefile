include .env
optimize:
	docker exec ${SERVER_INSTANCE} sh -c "php api/artisan optimize"
clear:
	docker exec ${SERVER_INSTANCE} sh -c "php api/artisan config:clear"optimize:
composer_install:
	docker exec ${SERVER_INSTANCE} sh -c "cd api && composer install"
migrate_sudo:
	sudo docker exec ${SERVER_INSTANCE} sh -c "php api/artisan optimize"
	sudo docker exec ${SERVER_INSTANCE} sh -c "php api/artisan migrate --database=mysql_sis --path='database/migrations/Apps'"
# 	sudo docker exec ${SERVER_INSTANCE} sh -c "php api/artisan migrate --database=mysql_apps --path='database/migrations/Apps'"
# 	sudo docker exec ${SERVER_INSTANCE} sh -c "php api/artisan migrate --database=mysql_pos --path='database/migrations/Pos'"
# 	sudo docker exec ${SERVER_INSTANCE} sh -c "php api/artisan migrate --database=mysql_atts --path='database/migrations/Atts'"
# 	sudo docker exec ${SERVER_INSTANCE} sh -c "php api/artisan migrate --database=mysql_hris --path='database/migrations/Hris'"
# 	sudo docker exec ${SERVER_INSTANCE} sh -c "php api/artisan migrate --database=mysql_eis --path='database/migrations/Eis'"
# 	sudo docker exec ${SERVER_INSTANCE} sh -c "php api/artisan migrate --database=mysql_pims --path='database/migrations/Pims'"
	sudo docker exec ${SERVER_INSTANCE} sh -c "php api/artisan migrate"
	sudo docker exec ${SERVER_INSTANCE} sh -c "php api/artisan db:seed"
migrate:
	docker exec ${SERVER_INSTANCE} sh -c "php api/artisan optimize"
#	docker exec ${SERVER_INSTANCE} sh -c "php api/artisan migrate --database=mysql_apps --path='database/migrations/Apps'"
#	docker exec ${SERVER_INSTANCE} sh -c "php api/artisan migrate --database=mysql_pos --path='database/migrations/Pos'"
#	docker exec ${SERVER_INSTANCE} sh -c "php api/artisan migrate --database=mysql_atts --path='database/migrations/Atts'"
#	docker exec ${SERVER_INSTANCE} sh -c "php api/artisan migrate --database=mysql_hris --path='database/migrations/Hris'"
#	docker exec ${SERVER_INSTANCE} sh -c "php api/artisan migrate --database=mysql_eis --path='database/migrations/Eis'"
#	docker exec ${SERVER_INSTANCE} sh -c "php api/artisan migrate --database=mysql_pims --path='database/migrations/Pims'"
	docker exec ${SERVER_INSTANCE} sh -c "php api/artisan migrate"
	docker exec ${SERVER_INSTANCE} sh -c "php api/artisan db:seed"
migrate_fresh:
	docker exec ${SERVER_INSTANCE} sh -c "php api/artisan optimize"
	docker exec ${SERVER_INSTANCE} sh -c "php api/artisan migrate:fresh"
	docker exec ${SERVER_INSTANCE} sh -c "php api/artisan db:seed"
seeder: 
	docker exec ${SERVER_INSTANCE} sh -c "php api/artisan optimize"
	docker exec ${SERVER_INSTANCE} sh -c "php api/artisan db:seed --class=RolesAndPermissionSeeder"

migrate_rollback_one:
	docker exec ${SERVER_INSTANCE} sh -c "php api/artisan optimize"
	docker exec ${SERVER_INSTANCE} sh -c "php api/artisan migrate:rollback"
# 	docker exec ${SERVER_INSTANCE} sh -c "php api/artisan migrate:rollback --database=mysql_apps --path='database/migrations/Apps'"
# docker exec ${SERVER_INSTANCE} sh -c "php api/artisan migrate --database=mysql_pos --path='database/migrations/Pos'"
# docker exec ${SERVER_INSTANCE} sh -c "php api/artisan migrate --database=mysql_atts --path='database/migrations/Atts'"
# docker exec ${SERVER_INSTANCE} sh -c "php api/artisan migrate --database=mysql_hris --path='database/migrations/Hris'"
# docker exec ${SERVER_INSTANCE} sh -c "php api/artisan migrate --database=mysql_eis --path='database/migrations/Eis'"
# docker exec ${SERVER_INSTANCE} sh -c "php api/artisan migrate --database=mysql_pims --path='database/migrations/Pims'"
# docker exec ${SERVER_INSTANCE} sh -c "php api/artisan migrate"
	docker exec ${SERVER_INSTANCE} sh -c "php api/artisan optimize"
initialize:
	docker exec ${DB_INSTANCE} mysql -p${DB_PASSWORD} \
		-e " \
			CREATE DATABASE IF NOT EXISTS kis; \
			CREATE DATABASE IF NOT EXISTS kis_rmis; \
		   "
	sudo chmod 777 api/storage -R	
restore_warning:
	cat ${DB_DIR}/kis.sql | docker exec -i ${DB_INSTANCE} mysql -p${DB_PASSWORD} kis
	cat ${DB_DIR}/kis_sis.sql | docker exec -i ${DB_INSTANCE} mysql -p${DB_PASSWORD} kis
# 	cat ${DB_DIR}/kis_apps.sql | docker exec -i ${DB_INSTANCE} mysql -p${DB_PASSWORD} kis_apps
# 	cat ${DB_DIR}/kis_atts.sql | docker exec -i ${DB_INSTANCE} mysql -p${DB_PASSWORD} kis_atts
# 	cat ${DB_DIR}/kis_hris.sql | docker exec -i ${DB_INSTANCE} mysql -p${DB_PASSWORD} kis_hris
# 	cat ${DB_DIR}/kis_eis.sql | docker exec -i ${DB_INSTANCE} mysql -p${DB_PASSWORD} kis_eis
# 	cat ${DB_DIR}/kis_pims.sql | docker exec -i ${DB_INSTANCE} mysql -p${DB_PASSWORD} kis_pims
# 	cat ${DB_DIR}/kis_pos.sql | docker exec -i ${DB_INSTANCE} mysql -p${DB_PASSWORD} kis_pos
#	cat ${DB_DIR}/kis_cacs.sql | docker exec -i ${DB_INSTANCE} mysql -p${DB_PASSWORD} kis_cacs
dev:
	cd app && npm run dev
devspace:
	cd app && npm run devspace
build:
	cd app && npm run build
up:
	docker compose down && docker compose up -d
down:
	docker compose down
up_dist:
	docker compose -f docker-compose.dist.yml up -d
down_dist:
	docker compose -f docker-compose.dist.yml down
pull:
	chmod 777 app/dist -R && git pull --all
# GUIDE FOR NEW MIGRATION
migrate_new:
# docker exec ${SERVER_INSTANCE} sh -c "php api/artisan --database=mysql_eis make:migration add_exam_scores_breakdown"
	docker exec ${SERVER_INSTANCE} sh -c "php api/artisan  migrate --database=mysql_eis --path='database/migrations/Eis'"
rollback_new:
	docker exec ${SERVER_INSTANCE} sh -c "php api/artisan  migrate:rollback --database=mysql_eis --path='database/migrations/Eis'"