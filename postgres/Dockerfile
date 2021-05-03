# Secure and Minimal image to take Postgresql backups.
# https://hub.docker.com/repository/docker/huggla/sam-backup

# =========================================================================
# Init
# =========================================================================
# ARGs (can be passed to Build/Final) <BEGIN>
ARG SaM_VERSION="2.0.5"
ARG BASE_VERSION="20210503"
ARG IMAGETYPE="application"
ARG BASEIMAGE="huggla/sam-backup:base-$BASE_VERSION"
ARG RUNDEPS="libpq libldap"
ARG BUILDDEPS="postgresql-client"
ARG BUILDCMDS=\
"   cp -a /usr/bin/pg_dump* /finalfs/usr/bin/ "\
"&& cp -a /usr/lib/libsasl2* /finalfs/usr/lib/"
ARG EXECUTABLES="/usr/bin/pg_dumpall /usr/bin/pg_dump"
# ARGs (can be passed to Build/Final) </END>

# Generic template (don't edit) <BEGIN>
FROM ${CONTENTIMAGE1:-scratch} as content1
FROM ${CONTENTIMAGE2:-scratch} as content2
FROM ${CONTENTIMAGE3:-scratch} as content3
FROM ${CONTENTIMAGE4:-scratch} as content4
FROM ${CONTENTIMAGE5:-scratch} as content5
FROM ${INITIMAGE:-${BASEIMAGE:-huggla/secure_and_minimal:$SaM_VERSION-base}} as init
# Generic template (don't edit) </END>

# =========================================================================
# Build
# =========================================================================
# Generic template (don't edit) <BEGIN>
FROM ${BUILDIMAGE:-huggla/secure_and_minimal:$SaM_VERSION-build} as build
FROM ${BASEIMAGE:-huggla/secure_and_minimal:$SaM_VERSION-base} as final
COPY --from=build /finalfs /
# Generic template (don't edit) </END>

# =========================================================================
# Final
# =========================================================================
ENV VAR_LINUX_USER="postgres" \
    VAR_PORT="5432" \
    VAR_FORMAT="custom" \
    VAR_JOBS="1" \
    VAR_COMPRESS="9" \
    VAR_DUMP_GLOBALS="yes"

# Generic template (don't edit) <BEGIN>
USER starter
ONBUILD USER root
# Generic template (don't edit) </END>
