ARG TAG="20190220"
ARG MAKEDIRS="/var/spool/cron/crontabs"
ARG EXPOSEFUNCTIONS="readEnvironmentVars runBinCmdAsLinuxUser execCmdAsLinuxUser trim"

#--------Generic template (don't edit)--------
FROM ${CONTENTIMAGE1:-scratch} as content1
FROM ${CONTENTIMAGE2:-scratch} as content2
FROM ${INITIMAGE:-${BASEIMAGE:-huggla/base:$TAG}} as init
FROM ${BUILDIMAGE:-huggla/build} as build
FROM ${BASEIMAGE:-huggla/base:$TAG} as image
ARG CONTENTSOURCE1
ARG CONTENTSOURCE1="${CONTENTSOURCE1:-/}"
ARG CONTENTDESTINATION1
ARG CONTENTDESTINATION1="${CONTENTDESTINATION1:-/buildfs/}"
ARG CONTENTSOURCE2
ARG CONTENTSOURCE2="${CONTENTSOURCE2:-/}"
ARG CONTENTDESTINATION2
ARG CONTENTDESTINATION2="${CONTENTDESTINATION2:-/buildfs/}"
ARG CLONEGITSDIR
ARG DOWNLOADSDIR
ARG MAKEDIRS
ARG MAKEFILES
ARG EXECUTABLES
ARG STARTUPEXECUTABLES
ARG EXPOSEFUNCTIONS
ARG GID0WRITABLES
ARG GID0WRITABLESRECURSIVE
ARG LINUXUSEROWNED
COPY --from=build /imagefs /
RUN [ -n "$LINUXUSEROWNED" ] && chown 102 $LINUXUSEROWNED || true
#---------------------------------------------

ENV VAR_FINAL_COMMAND="/usr/sbin/crond -f -d 8" \
    VAR_BACKUP_DIR="/backup" \
    VAR_DELETE_DUPLICATES="yes" \
    VAR_KEEP_CAPS="cap_setuid,cap_setgid"

#--------Generic template (don't edit)--------
USER starter
ONBUILD USER root
#---------------------------------------------
