# Galaxy - Imaging flavour
#
# VERSION       0.1

FROM bgruening/galaxy-stable:dev

MAINTAINER Björn A. Grüning, bjoern.gruening@gmail.com

ENV GALAXY_CONFIG_BRAND Galaxy Imaging

ENV GALAXY_CONFIG_ENABLE_BETA_TOOL_COMMAND_ISOLATION True
RUN add-tool-shed --url 'http://testtoolshed.g2.bx.psu.edu/' --name 'Test Tool Shed'

ENV GALAXY_CONFIG_CONDA_AUTO_INSTALL True \
    GALAXY_CONFIG_CONDA_AUTO_INIT True \

RUN apt-get -qq update && apt-get install --no-install-recommends -y openjdk-7-jdk

# Install imaging tools
ADD imagingtoolbox_tools.yml $GALAXY_ROOT/tools.yaml
RUN install-tools $GALAXY_ROOT/tools.yaml

# Install imaging tour
ADD tours/imaging.galaxy_ui.yaml $GALAXY_ROOT/config/plugins/tours/imaging.galaxy_ui.yaml
