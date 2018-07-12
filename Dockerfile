FROM huggla/alpine

COPY ./root /

ENV VAR_FINAL_COMMAND="/usr/sbin/crond -f -d 8" \
    VAR_FINAL_CMD_AS_ROOT="yes" \
    VAR_BACKUP_DIR="/backup" \
    VAR_DELETE_DUPLICATES="yes"
