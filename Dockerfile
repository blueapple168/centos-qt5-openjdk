FROM centos:7
MAINTAINER Blueapple <blueapple1120@qq.com>

#Installing Developement tools
#Installing gcc openjdk
USER root
RUN yum -y update \
        && yum group -y install "Development Tools" \
        && yum -y install centos-release-scl-rh \
        && yum -y --enablerepo=centos-sclo-rh-testing install devtoolset-7-gcc devtoolset-7-gcc-c++ \
        && scl enable devtoolset-7 bash \
        && cp -r -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
        && yum -y install botan wget clucene09-core glx-utils mesa-libGLES \
        gstreamer-plugins-base libX11 libXrender libXi libXfixes libXext libxslt qt-x11 \
        libxkbcommon libxcb xcb-util-image xcb-util-keysyms xcb-util-renderutil \
        xcb-util-wm freetype fontconfig git epel-release \
        && yum -y install mosquitto cmake \
        && yum -y install java-1.8.0-openjdk.x86_64 java-1.8.0-openjdk-devel.x86_64 \
        && rm -rf /var/cache/yum \
        && wget http://download.qt.io/official_releases/qt/5.6/5.6.1/qt-opensource-linux-x64-5.6.1.run -P /home/ \
        && chmod +x /home/qt-unified-linux-x64-online.run
        
# Set java environment
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk.x86_64
ENV PATH $PATH:/usr/lib/jvm/java-1.8.0-openjdk.x86_64/jre/bin:/usr/lib/jvm/java-1.8.0-openjdk.x86_64/bin

ENTRYPOINT /bin/bash
