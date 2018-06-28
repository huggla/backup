FROM huggla/alpine

USER root

COPY ./start /start
COPY ./bin /usr/local/bin

ENV VAR_FINAL_COMMAND="/usr/sbin/crond -f -d 8" \
    VAR_BACKUP_DIR="/backup" \
    VAR_DELETE_DUPLICATES="yes"

USER starter
