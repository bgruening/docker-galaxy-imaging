# Galaxy - Imaging flavour
#
# VERSION       0.1

FROM bgruening/galaxy-stable:15.03

MAINTAINER Björn A. Grüning, bjoern.gruening@gmail.com

ENV GALAXY_CONFIG_BRAND Galaxy Imaging

RUN apt-get -qq update && apt-get install --no-install-recommends -y openjdk-7-jdk

RUN install-repository \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o bgruening --name image_processing" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_bunwarpj_adopt_transform" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_bunwarpj_align" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_bunwarpj_compare_elastic" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_bunwarpj_compare_elastic_raw" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_bunwarpj_compare_raw" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_bunwarpj_compose_raw" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_bunwarpj_compose_raw_elastic" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_bunwarpj_convert_to_raw" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_bunwarpj_elastic_transform" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_bunwarpj_raw_transform" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_convert_format" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_create_image" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_noise"
