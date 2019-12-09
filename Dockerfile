FROM couchbase:enterprise-6.0.3
WORKDIR cbmigrate
COPY script/CB-Migrate.sh .
CMD bash ./CB-Migrate.sh
