FROM raspbian/stretch

RUN apt-get update
RUN apt-get upgrade -y

# https://github.com/alexa/avs-device-sdk/wiki/Raspberry-Pi-Quick-Start-Guide

# Taking the lazy path as /home/pi is used in the official guide...
ARG basedir="/home/pi"
ARG sdkbasedir="${basedir}/sdk-folder"
ARG appnecessbasedir="${sdkbasedir}/application-necessities"

# Setup working directories
RUN mkdir -p ${sdkbasedir}
RUN cd ${sdkbasedir} && mkdir sdk-build sdk-source third-party application-necessities
RUN cd ${appnecessbasedir} && mkdir sound-files

# Install avs-device-sdk dependencies
RUN apt-get -y install \
    git gcc cmake build-essential libsqlite3-dev libcurl4-openssl-dev libfaad-dev \
    libsoup2.4-dev libgcrypt20-dev libgstreamer-plugins-bad1.0-dev \
    gstreamer1.0-plugins-good libasound2-dev doxygen \
    python python-pip libssl-dev

# Install PortAudio
RUN cd ${sdkbasedir}/third-party && \
    wget -c http://www.portaudio.com/archives/pa_stable_v190600_20161030.tgz && \
    tar zxf pa_stable_v190600_20161030.tgz && \
    cd portaudio && \
    ./configure --without-jack && \
    make

# Install commentjson python package
RUN /usr/bin/pip install commentjson

# Clone avs-device-sdk and Sensory wake word engine
RUN cd ${sdkbasedir}/sdk-source && \
    git clone git://github.com/alexa/avs-device-sdk.git
RUN cd ${sdkbasedir}/third-party && \
    git clone git://github.com/Sensory/alexa-rpi.git
# TODO make sure this worked
RUN cd ${sdkbasedir}/third-party/alexa-rpi/bin && \
    yes | ./license.sh

# Build sdk
RUN cd ${sdkbasedir}/sdk-build && \
    cmake ${sdkbasedir}/sdk-source/avs-device-sdk \
    -DSENSORY_KEY_WORD_DETECTOR=ON \
    -DSENSORY_KEY_WORD_DETECTOR_LIB_PATH=${sdkbasedir}/third-party/alexa-rpi/lib/libsnsr.a \
    -DSENSORY_KEY_WORD_DETECTOR_INCLUDE_DIR=${sdkbasedir}/third-party/alexa-rpi/include \
    -DGSTREAMER_MEDIA_PLAYER=ON \
    -DPORTAUDIO=ON \
    -DPORTAUDIO_LIB_PATH=${sdkbasedir}/third-party/portaudio/lib/.libs/libportaudio.a \
    -DPORTAUDIO_INCLUDE_DIR=${sdkbasedir}/third-party/portaudio/include

ARG numbuildjobs=1
RUN cd ${sdkbasedir}/sdk-build && make SampleApp -j${numbuildjobs}

# Configuration file setup
ARG installtoolsdir="${sdkbasedir}/sdk-source/avs-device-sdk/tools/Install"
ARG clientid
ARG productid
ARG serialnumber

RUN echo "\"clientId\": \"${clientid}\"" > ${installtoolsdir}/config.json
RUN echo "\"productId\": \"${productid}\"" >> ${installtoolsdir}/config.json
RUN cd ${installtoolsdir} && \
    bash genConfig.sh config.json ${serialnumber} ${sdkbasedir}/db \
    ${sdkbasedir}/sdk-source/avs-device-sdk \
    ${sdkbasedir}/sdk-build/avs-device-sdk/Integration/AlexaClientSDKConfig.json
