# =========================================================================
# Init
# =========================================================================
# ARGs (can be passed to Build/Final) <BEGIN>
ARG SaM_VERSION="1.1-edge"
ARG TAG="20191112"
ARG IMAGETYPE="base"
ARG MAKEDIRS="/var/spool/cron/crontabs"
ARG EXPOSEFUNCTIONS="readEnvironmentVars runBinCmdAsLinuxUser execCmdAsLinuxUser trim"
# ARGs (can be passed to Build/Final) </END>

# Generic template (don't edit) <BEGIN>
FROM ${CONTENTIMAGE1:-scratch} as content1
FROM ${CONTENTIMAGE2:-scratch} as content2
FROM ${CONTENTIMAGE3:-scratch} as content3
FROM ${CONTENTIMAGE4:-scratch} as content4
FROM ${CONTENTIMAGE5:-scratch} as content5
FROM ${INITIMAGE:-${BASEIMAGE:-huggla/sam_$SaM_VERSION:base-$TAG}} as init
# Generic template (don't edit) </END>

# =========================================================================
# Build
# =========================================================================
# Generic template (don't edit) <BEGIN>
FROM ${BUILDIMAGE:-huggla/sam_$SaM_VERSION:build-$TAG} as build
FROM ${BASEIMAGE:-huggla/sam_$SaM_VERSION:base-$TAG} as final
COPY --from=build /finalfs /
# Generic template (don't edit) </END>

# =========================================================================
# Final
# =========================================================================
ENV VAR_FINAL_COMMAND="/usr/sbin/crond -f -d 8" \
    VAR_BACKUP_DIR="/backup" \
    VAR_DELETE_DUPLICATES="yes" \
    VAR_KEEP_CAPS="cap_setuid,cap_setgid"

# Generic template (don't edit) <BEGIN>
USER starter
ONBUILD USER root
# Generic template (don't edit) </END>
