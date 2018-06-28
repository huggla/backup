FROM huggla/alpine

USER root

COPY ./start /start
COPY ./bin /usr/local/bin

RUN ln -s /start/includeFunctions /usr/local/bin/ \
 && ln -s /start/functions/readEnvironmentVars /start/functions/runBinCmdAsLinuxUser /start/functions/execCmdAsLinuxUser /start/functions/trim /usr/local/bin/functions/

ENV VAR_FINAL_COMMAND="/usr/sbin/crond -f -d 8" \
    VAR_BACKUP_DIR="/backup" \
    VAR_DELETE_DUPLICATES="yes"

USER starter
