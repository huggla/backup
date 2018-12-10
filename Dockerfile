ARG TAG="20181204"
ARG MAKEDIRS="/var/spool/cron/crontabs"
ARG EXPOSEFUNCTIONS="readEnvironmentVars runBinCmdAsLinuxUser execCmdAsLinuxUser trim"

#---------------Don't edit----------------
FROM ${CONTENTIMAGE1:-scratch} as content1
FROM ${CONTENTIMAGE2:-scratch} as content2
FROM ${INITIMAGE:-${BASEIMAGE:-huggla/base:$TAG}} as init
FROM ${BUILDIMAGE:-huggla/build:$TAG} as build
FROM ${BASEIMAGE:-huggla/base:$TAG} as image
COPY --from=build /imagefs /
#-----------------------------------------

ENV VAR_FINAL_COMMAND="/usr/sbin/crond -f -d 8" \
    VAR_BACKUP_DIR="/backup" \
    VAR_DELETE_DUPLICATES="yes" \
    VAR_KEEP_CAPS="cap_setuid"

#---------------Don't edit----------------
USER starter
ONBUILD USER root
#-----------------------------------------
