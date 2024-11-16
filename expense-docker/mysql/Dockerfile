FROM mysql:8.0
RUN groupadd expense \
    && useradd -g expense expense \
    && chown -R expense:expense /var/lib/mysql /var/run/mysqld /docker-entrypoint-initdb.d
ENV MYSQL_ROOT_PASSWORD=Amarapp@1 
# MYSQL_DATABASE=transactions \
# MYSQL_USER=expense \
# MYSQL_PASSWORD=Amarapp@1
COPY scripts/*.sql /docker-entrypoint-initdb.d
