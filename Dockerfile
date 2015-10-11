# Galaxy - Imaging flavour
#
# VERSION       0.1

FROM bgruening/galaxy-stable:dev

MAINTAINER Björn A. Grüning, bjoern.gruening@gmail.com

ENV GALAXY_CONFIG_BRAND Galaxy Imaging

ENV GALAXY_CONFIG_ENABLE_BETA_TOOL_COMMAND_ISOLATION True
RUN add-tool-shed --url 'http://testtoolshed.g2.bx.psu.edu/' --name 'Test Tool Shed'

RUN apt-get -qq update && apt-get install --no-install-recommends -y openjdk-7-jdk

RUN install-repository \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o bgruening --name image_processing" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_adjust_threshold_binary" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_analyze_particles_binary" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_analyze_skeleton" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_bunwarpj_align" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_bunwarpj_adopt_transform" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_bunwarpj_align" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_bunwarpj_compare_elastic" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_bunwarpj_compare_elastic_raw" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_bunwarpj_compare_raw" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_bunwarpj_compose_elastic" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_bunwarpj_compose_raw" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_bunwarpj_compose_raw_elastic" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_bunwarpj_convert_to_raw" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_bunwarpj_elastic_transform" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_bunwarpj_raw_transform" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_convert_format" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_create_image" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_enhance_contrast" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_find_edges" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_find_maxima" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_make_binary" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_math" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_noise" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_shadows" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_sharpen" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_skeletonize3d" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_smooth" \
    "--url https://testtoolshed.g2.bx.psu.edu/ -o iuc --name imagej2_watershed_binary"
