FROM huggla/alpine as stage1

COPY ./root /stage1
COPY ./root /

RUN ln -s /start/includeFunctions /usr/local/bin/ \
 && ln -s /start/functions/readEnvironmentVars /start/functions/runBinCmdAsLinuxUser /start/functions/execCmdAsLinuxUser /start/functions/trim /usr/local/bin/functions/ \
 && mv /usr/local/bin/includeFunctions /usr/local/bin/functions/readEnvironmentVars /usr/local/bin/functions/runBinCmdAsLinuxUser /usr/local/bin/functions/execCmdAsLinuxUser /usr/local/bin/functions/trim /stage1/usr/local/bin/functions/

FROM huggla/alpine

COPY --from=stage1 /stage1 /

ENV VAR_FINAL_COMMAND="/usr/sbin/crond -f -d 8" \
    VAR_FINAL_CMD_AS_ROOT="yes" \
    VAR_BACKUP_DIR="/backup" \
    VAR_DELETE_DUPLICATES="yes"
