# Creates a base image containing CentOS and the
# IBM Installation Manager.  Can be used to install
# additional products using IIM

FROM centos:7

# IIM should point to the install file
# TMP should point to a temporary directory for unpacking the files
# URL should be the ftp url where the file is stored
ARG URL
ARG IIM=agent.installer.linux.gtk.x86_64_1.8.8000.20171130_1105.zip
ARG TMP=/tmp

# Install pre-reqs
RUN yum -y install \
    unzip \
    wget && \
    yum -y update && \
    yum -y clean all


# Create a directory and unpack the IIM installation files
RUN mkdir $TMP/IIM &&\
    wget -q $URL/$IIM &&\
    unzip $IIM -d $TMP/IIM &&\
    rm -rf $IIM

WORKDIR $TMP/IIM

# Run the installation in silent mode
RUN ./installc \
    -acceptLicense \
    -accessRights nonAdmin \
    -dataLocation "/var/ibm/InstallationManager" \
    -installationDirectory "/opt/IBM/InstallationManager" \
    -log "/opt/IIM.log" \
    -showProgress

# Remove installation files
RUN rm -rf $TMP/IIM
