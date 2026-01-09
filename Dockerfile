# Galaxy - Imaging flavour

FROM quay.io/bgruening/galaxy:25.1.1

MAINTAINER Björn A. Grüning, bjoern.gruening@gmail.com

ENV GALAXY_CONFIG_BRAND="Galaxy Imaging" \
    ENABLE_TTS_INSTALL=True

# Install imaging tools
ADD imagingtoolbox_tools.yml $GALAXY_ROOT/tools.yaml
RUN install-tools $GALAXY_ROOT/tools.yaml

# Install imaging tour
#ADD tours/imaging.galaxy_ui.yaml $GALAXY_ROOT/config/plugins/tours/imaging.galaxy_ui.yaml
