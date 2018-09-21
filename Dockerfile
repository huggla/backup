FROM huggla/alpine-slim:20180921-edge as stage1

COPY ./rootfs /rootfs

RUN mkdir -p /rootfs/usr/local/bin/functions /rootfs/var/spool/cron/crontabs \
 && cd /rootfs/usr/local/bin \
 && ln -s ../../../start/includeFunctions ./ \
 && cd /rootfs/usr/local/bin/functions \
 && ln -s ../../../../start/functions/readEnvironmentVars ../../../../start/functions/runBinCmdAsLinuxUser ../../../../start/functions/execCmdAsLinuxUser ../../../../start/functions/trim ./

FROM huggla/base:20180921-edge

COPY --from=stage1 /rootfs /

ENV VAR_FINAL_COMMAND="/usr/sbin/crond -f -d 8" \
    VAR_BACKUP_DIR="/backup" \
    VAR_DELETE_DUPLICATES="yes"
