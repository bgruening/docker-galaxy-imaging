# Galaxy - Imaging

ARG BASE_IMAGE=quay.io/bgruening/galaxy:25.1.1
FROM ${BASE_IMAGE}

LABEL maintainer="Björn A. Grüning <bjoern.gruening@gmail.com>"

ENV GALAXY_CONFIG_BRAND="Galaxy Imaging" \
    ENABLE_TTS_INSTALL=True

# Install tools
ARG TOOL_FILE=imagingtoolbox_tools.yml
# We use ADD here and not COPY to support URLs from upstream tool files
ADD ${TOOL_FILE} $GALAXY_ROOT/tools.yaml
RUN tail -n +4 $GALAXY_ROOT/tools.yaml > $GALAXY_ROOT/tools_clean.yaml

RUN install-tools $GALAXY_ROOT/tools_clean.yaml

# Install imaging tour
#ADD tours/imaging.galaxy_ui.yaml $GALAXY_ROOT/config/plugins/tours/imaging.galaxy_ui.yaml
