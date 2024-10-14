RUN=docker-compose run --service-ports --rm --workdir="/go-orm-test" go-orm-test

migrate/new:
	${RUN} sh -c "sql-migrate new ${FILE_NAME}"

migration/status:
	${RUN} sh -c "sql-migrate status --env='development'"

migration/up:
	${RUN} sh -c "sql-migrate up --env='development'"

migration/down:
	${RUN} sh -c "sql-migrate down --env='development'"

psql:
	psql -h 127.0.0.1 -p 5632 -U user go-orm-test-db
