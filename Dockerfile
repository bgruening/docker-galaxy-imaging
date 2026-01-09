# Galaxy - Imaging flavour

FROM quay.io/bgruening/galaxy:25.1.1

MAINTAINER Björn A. Grüning, bjoern.gruening@gmail.com

ENV GALAXY_CONFIG_BRAND="Galaxy Imaging" \
    ENABLE_TTS_INSTALL=True

# Install imaging tools from upstream list (skip header lines)
RUN curl -fsSL https://raw.githubusercontent.com/usegalaxy-eu/usegalaxy-eu-tools/refs/heads/master/imaging.yaml | \
    tail -n +4 > $GALAXY_ROOT/tools.yaml && \
    install-tools $GALAXY_ROOT/tools.yaml

# Install imaging tour
#ADD tours/imaging.galaxy_ui.yaml $GALAXY_ROOT/config/plugins/tours/imaging.galaxy_ui.yaml
