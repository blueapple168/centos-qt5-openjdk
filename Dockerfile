FROM centos:7.4.1708

#Installing Developement tools 
RUN yum -y update \
        && rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm \
        && yum group -y install "Development Tools" \
        && yum -y install centos-release-scl-rh \
        && yum -y --enablerepo=centos-sclo-rh-testing install devtoolset-7-gcc devtoolset-7-gcc-c++ \
        && scl enable devtoolset-7 bash \
        && yum -y install botan wget clucene09-core glx-utils mesa-libGLES \
        gstreamer-plugins-base libX11 libXrender libXi libXfixes libXext libxslt qt-x11 \
        libxkbcommon libxcb xcb-util-image xcb-util-keysyms xcb-util-renderutil \
        xcb-util-wm freetype fontconfig git epel-release \
        && yum -y install mosquitto cmake qt5-qtbase qt5-qtbase-devel \
        && yum -y install java-1.8.0-openjdk.x86_64 java-1.8.0-openjdk-devel.x86_64 \
        && rm -rf /var/cache/yum \
        && rm -rf /var/tmp/* \
        && rm -rf /tmp/*
# Set java qt environment
ENV QT_HOME /usr/lib64/qt5
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk.x86_64
ENV PATH $PATH:/usr/lib/jvm/java-1.8.0-openjdk.x86_64/jre/bin:/usr/lib/jvm/java-1.8.0-openjdk.x86_64/bin:/usr/lib64/qt5/bin

ENTRYPOINT /bin/bash
